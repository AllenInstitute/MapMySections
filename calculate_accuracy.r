###########################################################################################
## Overview

# NOTE: to run this on your own, create an excel sheet called MapMySections_AccuracyAssessment.xlsx, where at least one sheet is called "Part1_AnswerKey" that lists the answers, as provided on the MapMySections data challenge page.  Then have another one or more sheets called anything you want that have the answers in the format: row 1 = "MapMySectionsID", and rows 2-28 are the column names for the solutions in the same order and with the same column names as they were originally provided in the entry form.  Replace the list in line 10 with the names of these sheets. Note that the "Count of best subclass" metric will not provide consistent information if you run it, as the results are in comparison with other entrant data, which is not provided.  Please reach out to Jeremy Miller (jeremym@alleninstitute.org) if you have any questions about this script.

# Uncomment this line and point to your working directory
#setwd("link_to_working_directory")

###########################################################################################
## Read in the answers and entrant data

library(readxl)
solution    <- as.data.frame(read_excel("MapMySections_AccuracyAssessment.xlsx", sheet = "Part1_AnswerKey")) # NOTE: this is the solution xlsx sheet provided
entrants    <- c("E1","E2","E3","E4","E5") # Anonymizing five entrants  
predictions <- list()
for (entrant in entrants)
  predictions[[entrant]] <- as.data.frame(read_excel("MapMySections_AccuracyAssessment.xlsx", sheet = entrant))
cell_types  <- colnames(solution)[2:28]

## Which cell types to consider?  (This is used a couple times below)
kp      <- rowSums(as.matrix(solution[,2:28]))>0
which_is_top <- apply(as.matrix(solution[kp,2:28]),1,function(x) x==max(x))
top_sub <- rownames(which_is_top)[apply(which_is_top,2,which.max)]


## NOT FOR GRADING, but for later, create some averages
colnames(predictions[[3]])[1] = "MapMySectionsID"
predictions[["all"]] <- predictions[[1]][,1:28]
entrants <- c(entrants,"all","best")

library(kit)
normalize <- function(x) {a = as.matrix(x); a/rowSums(a); }
predictions[["all"]][,2:28]  = pmean(normalize(predictions[[1]][,2:28]),
                                     normalize(predictions[[2]][,2:28]),
									 normalize(predictions[[3]][,2:28]),
									 normalize(predictions[[4]][,2:28]),
									 normalize(predictions[[5]][,2:28]),na.rm=TRUE)

## NOT FOR GRADING, but for later, manually assign a best prediction group based on which entrant did best for each subclass
best <- setNames(c("E1","E4","E4","E1","E1","E3",
                   "E1","E4","E2","E1","all","E3","E2"),
                 c("Astro.TE.NN","CLA.EPd.CTX.Car3.Glut","Endo.NN","L2.3.IT.CTX.Glut","L4.5.IT.CTX.Glut","L5.ET.CTX.Glut",
                   "L6.CT.CTX.Glut","L6.IT.CTX.Glut","Lamp5.Gaba","Oligo.NN","Pvalb.Gaba","Sst.Gaba","Vip.Gaba" )
)
predictions[["best"]] = predictions[["all"]]
for (i in 1:length(top_sub)){
  predictions[["best"]][kp,][i,2:28] = predictions[[best[names(best)==top_sub[i]]]][kp,][i,2:28]
}
kp2 <- which((rowSums(solution[,cell_types])<0)&(solution$Target_Cell_Population!="-1"))
for (i in kp2)
  if(is.element(solution$Target_Cell_Population[i],names(best))){
    predictions[["best"]][i,2:28] = predictions[[best[names(best)==solution$Target_Cell_Population[i]]]][i,2:28]
  }

## Define a function to calculate all the relevant statistics
cn <- c("cross_entropy","brier_score","correlation (R^2)", "any_correct_hit","fraction_correct_hits", "fraction_top_match")
statistics <- function(values) {

  # Separate predictions from results
  values <- as.numeric(values)
  len    <- round(length(values)/2)
  p_true <- values[1:len]
  q_pred <- values[(1+len):(2*len)]
  
  # For missing REAL DATA, return -1s
  if(min(p_true)<0)  return(c(-1,-1,rep(0,length(cn)-2)))
  
  # For missing PREDICTIONS, return -2s
  if((sum(is.na(q_pred))>0)|(min(q_pred)<0) )  return(c(-2,-2,rep(0,length(cn)-2)))
  
  # Scale the values to sum to 1
  p_true <- p_true/sum(p_true)
  q_pred <- q_pred/sum(q_pred)

  # Function to calculate cross-entropy for a single pair of probability vectors
  calculate_ce_single_obs <- function(p_true, q_pred, epsilon = 1e-15) {  # Default 1e-15, but I 1e-5 gives a different set of winners
    # Avoid log(0) by clipping predicted probabilities
    q_pred <- pmax(pmin(q_pred, 1 - epsilon), epsilon)

    # Calculate cross-entropy term-by-term
    ce_terms <- p_true * log(q_pred)
  
    # Sum the terms and negate
    -sum(ce_terms)
  }
  
  # Function to calculate Brier score (also called mean least squares error) for a single pair of probability vectors
  calculate_bs_single_obs <- function(p_true, q_pred) {
    # Sum of squared differences
    sum((q_pred - p_true)^2)
  }
  
  # Calculate r-squared statistic (correlation squred) between results and predictions
  correlation = cor(p_true,q_pred,method="p")^2
  
  # Sum the frequency in the q_pred for any p_true >0%
  any_hit = sum(q_pred[p_true>0])
  
  # Hit count = fraction of genetic tools with >50% accuracy (based on any_hit frequency)
  # Add minor scaling to have a top winner (e.g., 0.001*any_hit
  is_a_hit = ((any_hit>=0.5)+0)*0.999 + 0.001*any_hit
  
  # Check if the top predicted hit matches the actual top hit
  match = (which.max(q_pred)==which.max(p_true))+0
  match = 0.999*match + 0.001*any_hit
  
  # Calculate and return stats
  setNames(c(calculate_ce_single_obs(p_true, q_pred),
             calculate_bs_single_obs(p_true, q_pred),
			 correlation, 
			 any_hit,
             is_a_hit,			 
			 match
		     ),
		   cn)
}

###########################################################################################
## Calculate the statistics between predictions and the actual results
results <- list()
missing <- NULL
for (entrant in entrants){
  # Calculate statistics
  input <- as.matrix(cbind(solution[,cell_types],predictions[[entrant]][,cell_types]))
  stats <- t(apply(input,1,statistics))
  rownames(stats) <- solution[,1]
  
  # Deal with missing data
  # Ignore data points with missing SMART-Seq data
  stats <- stats[rowSums(stats)!=-2,]
  # Set missing data for cross_entropy at 75% percentile score (e.g., assume it would do poorly but not the most poorly)
  missing <- c(missing,sum(stats[,1]==-2))
  stats[stats[,1]==-2,1] = quantile(stats[stats[,1]!=-2,1],0.75)
  # Set missing data for Brier score at 1 (e.g., bad but not the absolute worst)
  stats[stats[,2]==-2,2] = 1
  
  results[[entrant]] <- stats
}

## For genetic tools that do not have SMART-seq, how many of top predictions align with the targeted cell populations
kp3 <- (rowSums(solution[,cell_types])<0)&(solution$Target_Cell_Population!="-1")
match_other <- NULL
for (entrant in entrants){
  top_hit  <- cell_types[apply(as.matrix(predictions[[entrant]][kp3,cell_types]),1,function(x) which.max(as.numeric(x))[1])]
  next_hit <- cell_types[apply(as.matrix(predictions[[entrant]][kp3,cell_types]),1,function(x){ x[x==max(x)] = 0; which.max(as.numeric(x))[1];})]
  match_other <- c(match_other,mean((top_hit==solution$Target_Cell_Population[kp3])|(next_hit==solution$Target_Cell_Population[kp3]),na.rm=TRUE))
}


###########################################################################################
## Now run some tests to see which methods are best for targeting which cell types

## function for grouping by cell type
findFromGroups <- function(datExpr,groupVector,fn="mean"){
  groups   = names(table(groupVector))
  fn       = match.fun(fn)
  datMeans = matrix(0,nrow=dim(datExpr)[2],ncol=length(groups))
    
  for (i in 1:length(groups)){
    datIn = datExpr[groupVector==groups[i],]
    if (is.null(dim(datIn)[1])) { datMeans[,i] = as.numeric(datIn)
    } else { datMeans[,i] = as.numeric(apply(datIn,2,fn)) }
  };    colnames(datMeans)  = groups;
  rownames(datMeans) = colnames(datExpr)
  return(datMeans)
}

results2 <- list()
for (i in 1:length(results)){
  results2[[i]] <- t(findFromGroups(results[[i]],top_sub))
  colnames(results2[[i]]) <- cn
}

library(omnibus)
is_best = results2[[1]]*0
for(i in 1:2)
  is_best[,i] = which.pmin(results2[[1]][,i],results2[[2]][,i],results2[[3]][,i],results2[[4]][,i],results2[[5]][,i])
for(i in 3:length(cn))
  is_best[,i] = which.pmax(results2[[1]][,i]*0,results2[[1]][,i],results2[[2]][,i],results2[[3]][,i],results2[[4]][,i],results2[[5]][,i])-1

is_consensus = apply(is_best,1,function(x) max(table(x))) >= 4
is_best[!is_consensus,] = 6

by_type = data.frame(subclass = rownames(is_best),method = entrants[apply(is_best,1,function(x) as.numeric(names(which.max(table(x)))))])
# Note that this output was used to build the manual table above.
print(by_type[order(by_type$method),])
#                subclass  method
#11            Pvalb.Gaba     all  # This one had two that were tied... all others had at least 4 method consensus on the winner
#1            Astro.TE.NN E1
#4       L2.3.IT.CTX.Glut E1
#5       L4.5.IT.CTX.Glut E1
#7         L6.CT.CTX.Glut E1
#10              Oligo.NN E1
#6         L5.ET.CTX.Glut   E3
#12              Sst.Gaba   E3
#2  CLA.EPd.CTX.Car3.Glut E4
#3                Endo.NN E4
#8         L6.IT.CTX.Glut E4
#9             Lamp5.Gaba E2
#13              Vip.Gaba E2


###########################################################################################
## Create a table of summary statistics for each entrant
out <- matrix(0,nrow=length(entrants),ncol=length(cn))
rownames(out) <- entrants
colnames(out) <- cn
for (entrant in entrants)
  out[entrant,] <- apply(results[[entrant]],2,mean)
out <- data.frame(out,fraction_nonvalidation_match=match_other)#,missing)
out$count_best_subclass = as.numeric(table(factor(by_type$method,level=entrants)))

## Create an average ranked score to sort by
outMatch <- out[1:5,]
outMatch[,1] = -outMatch[,1]
outMatch[,2] = -outMatch[,2]
outMatch     = -outMatch
for (i in 1:dim(outMatch)[2]) # Replaces apply below
  outMatch[,i] = rank(as.numeric(outMatch[,i]))
#outMatch     = apply(outMatch,2,rank)  # <- I don't know why this isn't working
meanRank     = rowMeans(outMatch)
order_view   = c(order(meanRank),6,7)
out$mean_rank = c(meanRank,NA,NA)

## Print the top hits
out <- out[order_view,c(1:6,8,7,9)]
print(out)
#   cross_entropy brier_score correlation..R.2. any_correct_hit fraction_correct_hits fraction_top_match count_best_subclass fraction_nonvalidation_match mean_rank
#E1      6.622001   0.6154023        0.21775714       0.4189671            0.46149589         0.30780358                   5                   0.36842105    1.5000
#E4     21.304717   0.8584087        0.17872329       0.4651069            0.46154203         0.19258049                   3                   0.31578947    2.3750
#E3     24.019505   0.7611469        0.15265569       0.3930101            0.28856609         0.19250839                   2                   0.28947368    3.5625
#E4      5.735769   0.6683889        0.11020941       0.3563044            0.30774092         0.09641400                   0                   0.17647059    3.6250
#E2      4.535169   0.6198312        0.05062235       0.2033229            0.05783794         0.01941486                   2                   0.05263158    3.9375
#all     2.865095   0.5119232        0.20821951       0.3827667            0.28855584         0.21170969                   1                   0.36842105        NA
#best    6.710121   0.4689428        0.34373237       0.5187634            0.51923030         0.42317261                   0                   0.42105263        NA

# Interestingly (although potentially not surprisingly, and partially by definition of "best") using some combination of all of the entrant's algorithms provides a better assessment of accuracy than using any single algorithm alone.

print(outMatch[order(meanRank),c(1:6,8,7)])
#   cross_entropy brier_score correlation..R.2. any_correct_hit fraction_correct_hits fraction_top_match count_best_subclass fraction_nonvalidation_match
#E1             3           1                 1               2                     2                  1                 1.0                            1
#E4             4           5                 2               1                     1                  2                 2.0                            2
#E3             5           4                 3               3                     4                  3                 3.5                            3
#E4             2           3                 4               4                     3                  4                 5.0                            4
#E2             1           2                 5               5                     5                  5                 3.5                            5
