## MapMySections

When you see a tissue section and only a fraction of the cells are stained, how can you tell which kind of cells are represented? We are seeking tools that can accurately make this connection and relate it to existing knowledge of cell types on Allen Brain Map.  Enter the MapMySections Data Challenge **ON THE MAIN EVENT PAGE** by 12:00pm (Pacific), on ????? ##, 2025. Challenge details below.

### About this challenge

Transgenic lines and viral tools provide highly valuable resources for targeting subpopulations of cells in the brain of mouse (and other species).  The recent identification of >5,000 mouse brain cell populations with distinct gene expression patterns and spatial profiles provides opportunities not only to create new cell type-specific genetic tools, but also to better characterize the cell type specificity of existing genetic tools widely used in neuroscience or newly generated in a lab. Accurately defining this connection between genetic tools and known cell types represents a critical step in interpreting the results of experiments using these tools, from functional assays to potential gene therapies. A detailed cell type characterization of the labeled cells can be achieved through a combination of single cell RNA-sequencing and cell sorting; however, such methods take time and costly and are prone to bias. A method for directly inferring cell types from fluorescent images without the need for additional experiments would be immediately applicable to thousands of existing genetic tools, greatly improving their utility and interpretability.  *Entrants are tasked with creating an algorithm that will accurately match fluorescent images to the most likely cell types and/or to present the algorithm as part of a user-friendly tool like [MapMyCells](https://portal.brain-map.org/atlases-and-data/bkp/mapmycells).*

![image](https://github.com/user-attachments/assets/d0066c2f-c27a-4a32-96cc-44421550c7e4)

### Entry Details

To be considered for the competition, please submit **ON THE MAIN EVENT PAGE**: 1) cell type assignments for query image, 2) the tool (or a link to the tool) for computing and displaying these results, and 3) the names and contact information of yourself and anyone on your team.  More details **ON THE MAIN EVENT PAGE**.

If you have any difficulties with submission, please contact Rachel Hostetler [hyperlink]

Participants will be scored based on two components, with a winner selected for each category independently:
1.	**Mapping accuracy**: This winning algorithm for this category will be selected based on a quantitative assessment of accuracy to the whole mouse brain cell types from Yao et al 2023, included in the ABC Atlas. 
2.	**Summarization of results**: Creation of a user-friendly tool that allows users to apply a mapping algorithm to query STPT images and receive most likely cell type results as output. This tool will optionally connect output results back to the ABC Atlas or other Allen Brain Map knowledge of cell types in some way. The definition of tool is intentionally left open, but some examples could include a website, an interactive table, or an R Studio or Jupyter notebook.  This winner will be selected by a panel of judges who will be grading on the following criteria: (1) usability (does it do something), (2) ease of use (can I figure out how to use it easily), (3) functionality (does the output make sense), and (4) sleekness (does it look cool and make you want to use it). **[NOTE: this  probably needs to be changed].**

Winners will have an opportunity to present their work at a to-be-scheduled webinar and will have their tool featured on Allen Brain Map (brain-map.org).  Other tools may also be included on Allen Brain Map and all participants agree to have their submissions publicly linked at Allen Brain Map.  **[NOTE: WE STILL NEED TO ACTUALLY DECIDE ON THE PRIZE. Publication? Presentation? Entry to workshop? Something else?]**

### Challenge data

*This section is not quite right--Jeremy to update*

This challenge includes query and training data from the [Genetics Tools Atlas](https://portal.brain-map.org/genetic-tools/genetic-tools-atlas), a searchable web tool representing information and data on enhancer-adeno-associated viruses (enhancer AAVs) and mouse transgenes. Multiple modalities for summarizing data are included as part of the atlas, but only coronal sections collected using Serial Two-Photon Tomography (STPT) sections will be included as part of the challenge.  Participants will be given **#####** STPT images from viruses with known (but withheld) cell type specificity along with the nearest MERFISH tissue section included in the [Allen Brain Cell Atlas](https://portal.brain-map.org/atlases-and-data/bkp/abc-atlas), which includes the transcriptomic cell of every identified cell along with anatomic overlays, and asked to identify the most likely cell types targeted by that viral vector.  As training data, participants will also have access to the entire [Genetics Tools Atlas](https://portal.brain-map.org/genetic-tools/genetic-tools-atlas) which includes ##### viruses with both STPT images series (matching the query data) and scRNA-seq profiling (providing ground truth cell type assignments) in the same brain region [????] as the query images.

Specifically this section needs:
* Links to the anonymized data table
* Link to the bucket with CCF normalized genetics tools and ABC Atlas sections
* Original ABC Atlas MERFISH tissue sections

### Additional resources, data access, and helpful hints

* Paragraph about what folks are seeing in the fluorescent images
* Links to the acronym tables
* Link to code from Lydia's team about how to access image data

#### Useful links

* Genetics Tools Atlas: https://portal.brain-map.org/genetic-tools/genetic-tools-atlas 
* ABC Atlas: https://portal.brain-map.org/atlases-and-data/bkp/abc-atlas 
* MapMyCells: https://portal.brain-map.org/atlases-and-data/bkp/mapmycells 
* MapMySpikes: https://alleninstitute.org/events/mapmyspikes/ 
* [LIKELY NEED MANY MORE, TBD]

### Background

The [Genetics Tools Atlas](https://portal.brain-map.org/genetic-tools/genetic-tools-atlas) is a searchable web tool representing information and data on enhancer-adeno-associated viruses (enhancer AAVs) and mouse transgenes. The characterization data include Epifluorescence imaging (EPI), Serial Two-Photon Tomography (STPT), and Single Cell/Single Nucleus RNA-sequencing generated at the Allen Institute for Brain Science.  These genetic tools have been published in several peer-reviewed manuscripts, and are largely available on [Addgene](https://www.addgene.org/collections/brain-armamentarium/) (as part of the BRAIN Armamentarium Collection of plasmids and viral preps) or at [The Jackson Laboratory](https://www.jax.org/jax-mice-and-services/find-and-order-jax-mice/most-popular-jax-mice-strains/strain-collections) (transgenic mice).

The [Allen Brain Cell Atlas](https://portal.brain-map.org/atlases-and-data/bkp/abc-atlas) provides a platform for visualizing multimodal single cell data across the mammalian brain and aims to empower researchers to explore and analyze multiple whole-brain datasets simultaneously. This open science resource, developed by the Allen Institute as part of the Brain Knowledge Platform, allows unprecedented insights into the enormous diversity of cell types in the brain and where they are. As the Allen Institute and its collaborators continue to add new modalities, species, and insights to the ABC Atlas, this groundbreaking platform will keep growing, opening up endless possibilities for discoveries and breakthroughs in neuroscience. The ABC Atlas enables the neuroscience community to identify more cell types in the brain, investigate the spatial location of cell types, investigate gene expression and co-expression patterns in cell types, and refine boundaries and knowledge of brain regions defined by gene expression.

Allen Brain Map and BICCN have tools for allowing scientists to compare their gene expression data with cell types in motor cortex ([Azimuth](https://azimuth.hubmapconsortium.org/); accessible via the [Cell Type Knowledge Explorer](https://knowledge.brain-map.org/celltypes)) and spanning the whole brain ([MapMyCells](https://portal.brain-map.org/atlases-and-data/bkp/mapmycells)).  These tools directly transfer (or “map”) cell type assignments to user-provided cells, also allowing a transfer of associated knowledge about that cell type.  For example, cells in motor cortex matching to Pvalb interneurons based on gene expression are also likely to be fast spiking and to have either basket or chandelier morphologies.  Similarly, putative spatial locations can be assigned to a cell collected from a dissociation protocol by mapping it to the whole mouse brain and then seeing where that cell is located using the [Allen Brain Cell Atlas](https://portal.brain-map.org/atlases-and-data/bkp/abc-atlas).  Finally, by mapping cell type assignments to cells collected from individuals with Alzheimer’s disease (e.g., in [SEA-AD](https://portal.brain-map.org/explore/seattle-alzheimers-disease)) and other disorders, scientists can understand which cell types change and how they change in different states.  While other algorithms exist for mapping transcriptomics (and other ‘-omics’) data between reference cell types and query data, Azimuth and MapMyCells are web-based, making them accessible to researchers and students with a wide range of computational and biological competencies.  Last year’s data challenge, [MapMySpikes](https://alleninstitute.org/events/mapmyspikes/), asked participants to accurate make the connection between firing properties of a cell and the cell’s molecular type to relate it to existing knowledge of cell types on Allen Brain Map; otherwise, nearly all web-based mapping algorithms focus on gene expression.  MapMySections, like MapMySpikes, aims to extend the types of experimental data that can be aligned to transcriptomically-defined cell types. 
