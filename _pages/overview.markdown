## MapMySections

When you see a tissue section and only a fraction of the cells are stained, how can you tell which kind of cells are represented? We are seeking tools that can accurately make this connection and relate it to existing knowledge of cell types on Allen Brain Map.  Enter the MapMySections Data Challenge [**ON THE MAIN EVENT PAGE**](https://github.com/AllenInstitute/MapMySections/edit/main/_pages/challenge_page.markdown) by 12:00pm (Pacific), on <ins>***XXXXX***</ins>, 2025. Challenge details below.

![image](https://github.com/user-attachments/assets/effe7089-9125-41b1-bc0f-c99a29781885)

*(This is a draft icon. Improve it, and then move it and the table of contents to the side bar when I figure out how to make a side bar.)*

## Table of Contents 

1. [About this Challenge](#about-this-challenge)
2. [Primary image series data access](#primary-image-series-data-access)
3. [Restricting analysis to targeted brain regions (typically VISp)](Restricting-analysis-to-targeted-brain-regions-typically-visp)
4. [Spatial localization of mouse brain cell types](#spatial-localization-of-mouse-brain-cell-types)
5. [Key considerations](#key-considerations)
6. [Useful links](#useful-links)

## About this Challenge

Transgenic lines and viral tools provide highly valuable resources for targeting subpopulations of cells in the brain of mouse (and other species).  The recent identification of >5,000 mouse brain cell populations with distinct gene expression patterns and spatial profiles provides opportunities not only to create new cell type-specific genetic tools, but also to better characterize the cell type specificity of existing genetic tools widely used in neuroscience or newly generated in a lab. Accurately defining this connection between genetic tools and known cell types represents a critical step in interpreting the results of experiments using these tools, from functional assays to potential gene therapies. A detailed cell type characterization of the labeled cells can be achieved through a combination of single cell RNA-sequencing and cell sorting; however, such methods take time and costly and are prone to bias. A method for directly inferring cell types from fluorescent images without the need for additional experiments would be immediately applicable to thousands of existing genetic tools, greatly improving their utility and interpretability.  *Entrants are tasked with creating an algorithm that will accurately match fluorescent images to the most likely cell types and/or to present the algorithm as part of a user-friendly tool like [MapMyCells](https://portal.brain-map.org/atlases-and-data/bkp/mapmycells).*

![image](https://github.com/user-attachments/assets/d0066c2f-c27a-4a32-96cc-44421550c7e4)

This challenge includes images and associated cell type specificity for anonymized genetics tools from the [Genetics Tools Atlas](https://portal.brain-map.org/genetic-tools/genetic-tools-atlas), a searchable web resource representing information and data on enhancer-adeno-associated viruses (enhancer AAVs) and mouse transgenes. Multiple modalities for summarizing data are included as part of the atlas, but only coronal sections collected using Serial Two-Photon Tomography (STPT) sections will be directly included as part of the challenge.  Cell type specificity is assessed by applying single cell RNA-sequencing (SmartSeqV4) on fluorescently labeled cells from each genetic tool, and then mapping these cells to the published taxonomy of cell types in whole mouse brain [(Yao et al, 2023)](https://pmc.ncbi.nlm.nih.gov/articles/PMC10719114/), which are available in the [Allen Brain Cell Atlas](https://portal.brain-map.org/atlases-and-data/bkp/abc-atlas).

**[⬆ back to top](#mapmysections)**

## Primary image series data access

Images are divided into a training data set with <ins>***XXXXX***</ins> genetic tools (where cell type assignments are provided) and a test data set with <ins>***XXXXX***</ins> genetic tools (where entrants are asked to predict cell type assignments). STPT image series and associated metadata are included for each genetic tool.  This information is provided as an interactive BioFileFinder (BFF) spreadsheet.  

***[ACCESS THE TEST AND TRAINING DATA HERE]*** <-- need to create this BioFileFinder (BFF) spreadsheet 

In this spreadsheet, each row is a different genetic tool, and columns correspond to the following:

* **Experiment ID**: A unique, anonymized identifier for each experiment.  These identifiers will be linked to actual experiment identifiers in the [Genetics Tools Atlas](https://portal.brain-map.org/genetic-tools/genetic-tools-atlas) at the conclusion of the challenge.
* **Dataset**: Either “Training” to indicate this experiment is part of the training data set or “Test” to indicate it is part of the test data set (in which case “Cell Type Assignments” will be blank)
* **Genetic Tools Type**: Either “Enhancer AAV” or “Mouse transgenic line” to indicating the underlying type of genetic tool.  Note that the training and test data sets each include some enhancer AAVs and some mouse transgenic lines.  
* **Cell Type Assignments**: A comma-separated list of whole mouse brain cell types (“clusters”) and associated specificity of that genetic tools to each cell type in Brain Region Targeted. Specificity is defined as the fraction of fluorescent cells processed through scRNA-seq from Brain Region Targeted that map to a given cluster.
* **Brain Region Targeted**: The anatomic structure(s) for which cell type assignments have been tested.  For the vast majority of cases this will be VISp (primary visual cortex), although a few genetic tools focus on basal ganglia or the entire brain.
* **Difficulty**: A qualitative assessment of how difficult it would be for an expert annotator to identify assigned cell types directly from the image.  Examples of “Easy” image series would be a genetic tool restricted to cortical layer 4 which maps to excitatory types only found in layer 4, whereas a “Hard” genetic tool could show more scattered expression (e.g., inhibitory neurons not restricted to layer 1) or show expression in multiple unrelated cell populations. Genetic tools tagged as “Medium” would be somewhere between.
* **(OTHER LABEL ASSESSMENTS??)**: Other assessments about the labeling may or may not be included. These could include: LABEL_Strength (strong, weak, none, etc), columns about predicted gene targeting, cross-species conservation, anything else?
* **STPT Image Series Data**: Link to the image series in omi-zarr format. This is the primary data required for the challenge.  See <ins>***THIS LINK TO A NEW JUPYTER NOTEBOOK***</ins> for how to access and use these data.
* **STPT Image Series Visualization**: Link to same data for visualization using Neuroglancer
* **CCF-registered STPT Image Data**: Link to image file containing intensities of red and green channels for each 10um CCF voxel in XXX format. See <ins>***THIS LINK TO A DIFFERENT NEW JUPYTER NOTEBOOK***</ins> for how to access and use these data.

Other columns ***TO BE OMITTED BEFORE POSTING***:

* **To be Included in MapMySections**: TRUE/FALSE call about whether a tool will be included in this data challenge.  Only genetic tools with TRUE will be posted. To get TRUE a tool must: (1) include SSv4 and STPT data, (2) label one or more cell type (e.g., nothing with “No-Labeling” in LABEL_Specificity), and (3) look “correct” by Sharon or someone else and/or have some quality assessment that it would be a useful enhancer for the challenge.  Note some additional “High Importance Tools” with STPT data but potentially missing SSv4 data could also be included in the test data set.
* **SSv4 Data Location**: Whether cell type specificity information from SSv4 will be included on the February release of GTA (“GTA”), whether it will only be released as part of the manuscript (“Paper”), or whether it exists internally but won’t be published anywhere (“AIBS”).
* **ATAC-seq Cell Type Assignments**: I’m not sure exactly what this looks like or what fraction of genetics tools we have this information for, but my understanding is that we can use ATAC-seq results to infer cell type specificity for some subset of enhancers for some level of cell type resolution.
* **Cell Type Additional Information**: Any other “secret” information we have about cell type specificity based on expert manual annotations in the “Brain Regions Targeted” or anywhere else in the brain.  This can be blank for most of the genetic tools.
* **High Importance Tool**: Slot for Yoav, Jonathan, Deepanjali, or anyone else to indicate whether this genetic tool is of high importance.  Ideally this will include 3-5 genetic tools per person.  Write you name in this slot if you want to include this. Any tool in this category will be included in the challenge as part of the “Test data set”, but may or may not be scored. 

The test data set includes the same information as the training data set for an additional ***(#####)*** genetic tools, except that the column called “Cell Type Assignments” is left blank.  To complete this challenge, please submit cell type assignments as described in the Entry Details section.

**[⬆ back to top](#mapmysections)**

## Restricting analysis to targeted brain regions (typically VISp)

Unless otherwise noted, the challenge focuses only on cell types in VISp, although a few bonus tools focused on basal ganglia and across the whole brain are provided.  A few resources are provided to help entrants restrict their analyses to specific brain regions (and which may also aid in completing the challenge!):

* **Image registration to Allen Common Coordinate Framework (CCF)**:  All STPT image series are registered to the CCF, meaning that every X-Y-Z location in STPT images can be assigned an X-Y-Z location (“voxel”) in a standard anatomical reference space along with an associated brain region name. Similarly, MERFISH image series on the [Allen Brain Cell Atlas](https://portal.brain-map.org/atlases-and-data/bkp/abc-atlas) are also registered to the CCF, meaning each voxel also contains it’s cell type composition (from one mouse).  More details on CCF registration and data access are available <ins>***TBD TBD TBD***</ins>.
* **Known spatial localization of cell types**: The relationship between cell types and brain regions and cell types (including VISp) is described in detail in [Yao et al 2023](https://pmc.ncbi.nlm.nih.gov/articles/PMC10719114/).  These relationships can also be explored interactively using [Annotation Comparison Explorer](https://sea-ad.shinyapps.io/ACEapp/) (“Mouse cell type classification” - “Spatial localization of brain cell types”).  Finally, a table listing all cell types found in mouse VISp is provided <ins>***TBD TBD TBD***</ins>.

**[⬆ back to top](#mapmysections)**

## Spatial localization of mouse brain cell types

The mouse whole brain transcriptomics cell type atlas contains 5,322 cell types (clusters) that are organized in a hierarchical manner with nested groupings of 34 classes, 338 subclasses, 1,201 supertypes and 5,322 clusters. The anatomical location of each cell type has been annotated using a comprehensive brain-wide MERFISH dataset with a total of ~4 million segmented and QC-passed cells, probed with a 500-gene panel and registered to the Allen Mouse Brain Common Coordinate Framework (CCF v3). The MERFISH data not only provide accurate spatial annotation of cell types at subclass, supertype and cluster levels, but also reveal fine-resolution spatial distinctions or gradients for cell types.  

In addition to gene tools image series, cell type information from this atlas **is required or recommended to succeed in this challenge**. The spatial location of every mouse cell type can be interactively explored using the Allen Brain Cell Atlas [at this link](https://knowledge.brain-map.org/abcatlas#AQIBSzlKTjIzUDI0S1FDR0s5VTc1QQACSFNZWlBaVzE2NjlVODIxQldZUAADAAQBAAKDgDx7g46YHgOEuBCEhSrCAwQyTlFUSUU3VEFNUDhQUUFITzRQAAWBr6ZKgemsDoGggUeAktXoBgAHAAAFAAYBAQJGUzAwRFhWMFQ5UjFYOUZKNFFFAAN%2BAAAABAAACFZGT0ZZUEZRR1JLVURRVVozRkYACUxWREJKQVc4Qkk1WVNTMVFVQkcACgALAVRMT0tXQ0w5NVJVMDNEOVBFVEcAAjczR1ZURFhERUdFMjdNMlhKTVQAAwEEAQACIzAwMDAwMAADyAEABQEBAiMwMDAwMDAAA8gBAAAAAUFQOEpOTjVMWUFCR1ZNR0tZMUIAAlExTkNXV1BHNkZaMEROSVhKQlEAAwAEAQECgazlhIG8aWIDhMwEVIT%2BMccABQAGAQECRlMwMERYVjBUOVIxWDlGSjRRRQADfgAAAAQAAAhHNEk0R0ZKWEpCOUFUWjNQVFgxAAlMVkRCSkFXOEJJNVlTUzFRVUJHAAoACwFub25lAAJub25lAAMBBAEAAiMwMDAwMDAAA8gBAAUBAQIjMDAwMDAwAAPIAQAAAAIDAA%3D%3D). 

Spatial data and associated metadata can be accessed for off-line use in the following locations:
* **MERFISH raw data images**: ***I don't know if these exist??? If so, would be useful to share.***
* **CCF locations of mouse brain cells**: Point-by-point mapping of the location of each cell in the original MERFISH coordinate space and the CCF [**is available here**](https://alleninstitute.github.io/abc_atlas_access/descriptions/MERFISH-C57BL6J-638850-CCF.html). These data include cell type assignments for each cell, and this page also includes links to related data sets and to Jupyter notebooks for data access.
* **Code comparing cell types and anatomic structures**: Specifically, [this Jupyter notebook](https://alleninstitute.github.io/abc_atlas_access/notebooks/merfish_ccf_registration_tutorial.html) describes how to access and use the data above, relating CCF coordinates and mouse brain cell types.
* **Acronym list**: [This table](https://brainmapportal-live-4cc80a57cd6e400d854-f7fdcae.divio-media.net/filer_public/c8/42/c8421c8e-72d8-4781-8505-8770e88671a7/whole_mouse_brain_acronym_june_2024.xlsx) includes a list of acronyms and abbreviations for brain regions, genes, and cell types used in mouse whole brain cluster names, along with identifiers for relevant data sources (e.g., Mouse Brain Atlas, UBERON, CL).

**[⬆ back to top](#mapmysections)**

## Key considerations

***THIS SECTION NEEDS MAJOR UPDATES***
<ins>Paragraph about what folks are seeing in the fluorescent images, along with challenges and pitfalls. </ins>
* The images show XXX in the green channel and YYYY in the red channel, but sometimes there is bleed over.
* Comparing cell centroids (ABC Atlas) to cytoplasm reporter, potential problem with dense labeling and cell overlap
* Genetic tools can label any number of cell types across the taxonomy
* Weak vs. strong labeling sometimes
* We are sidestepping the challenge of aligning individual images to the MERFISH reference as all challenge data includes Z-stack information

**[⬆ back to top](#mapmysections)**

### Useful links

* Genetics Tools Atlas: https://portal.brain-map.org/genetic-tools/genetic-tools-atlas 
* ABC Atlas: https://portal.brain-map.org/atlases-and-data/bkp/abc-atlas 
* MapMyCells: https://portal.brain-map.org/atlases-and-data/bkp/mapmycells 
* MapMySpikes: https://alleninstitute.org/events/mapmyspikes/ 
* <ins>***(LIKELY NEED MANY MORE, TBD). Maybe links to relevant CCF community forum posts and or external tools (Priya's project)?***</ins>

**[⬆ back to top](#mapmysections)**
