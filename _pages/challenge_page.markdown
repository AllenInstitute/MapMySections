*(This is a placeholder page for the main MapMySections page on alleninstitute.org)*

## MapMySections general info

**Short name**: MapMySections Data Challenge 
**Tagline**: assign cell types to sparsely labeled fluorescent images
**Long name**: MapMySections Data Challenge: create a “MapMyCells”-like algorithm and user interface for matching fluorescent images of mouse genetic tools to corresponding cell types on the Allen Brain Cell Atlas

### Meta Description
When you see a tissue section and only a fraction of the cells are stained, how can you tell which kind of cells are represented? We are seeking tools that can accurately make this connection and relate it to existing knowledge of cell types on Allen Brain Map.

### Image [DRAFT!!!!!!!]

![image](https://github.com/user-attachments/assets/becb37da-3ad8-4546-b0d9-1ce90c48b7a4)
 
### Overview

When you see a tissue section and only a fraction of the cells are stained, how can you tell which kind of cells are represented? We are seeking tools that can accurately make this connection and relate it to existing knowledge of cell types on Allen Brain Map.  Enter the MapMySections Data Challenge below by 12:00pm (Pacific), on ????? ##, 2025.

For more challenge details and data access, please visit [the MapMySections Challenge data page](https://github.com/AllenInstitute/MapMySections/blob/main/_pages/overview.markdown).

## Entry Details

To be considered for the competition, please submit ***[AT ???? LINK]***: 1) cell type assignments for each query image series, 2) the tool (or a link to the tool) for computing and displaying these results, and 3) the names and contact information of yourself and anyone on your team.  More details at [the MapMySections Challenge data page](https://github.com/AllenInstitute/MapMySections/blob/main/_pages/overview.markdown).

If you have any difficulties with submission, please contact Rachel Hostetler ***[hyperlink]***

Participants will be scored based on two components, with a winner selected for each category independently:
1. **Mapping accuracy**: This winning algorithm for this category will be selected based on a quantitative assessment of accuracy to the whole mouse brain cell types from Yao et al 2023, included in the ABC Atlas.
2. **Summarization of results**: Creation of a user-friendly tool that allows users to apply a mapping algorithm to query STPT images and receive most likely cell type results as output. This tool will optionally connect output results back to the ABC Atlas or other Allen Brain Map knowledge of cell types in some way. The definition of tool is intentionally left open, but some examples could include a website, an interactive table, or an R Studio or Jupyter notebook.  This winner will be selected by a panel of judges who will be grading on the following criteria: (1) usability (does it do something), (2) ease of use (can I figure out how to use it easily), (3) functionality (does the output make sense), and (4) sleekness (does it look cool and make you want to use it). ***[NOTE: this part probably needs to be changed].***

### Incentives for entry (TO BE EDITED)

Winners will have an opportunity to present their work at a to-be-scheduled webinar and will have their tool featured on Allen Brain Map (brain-map.org).  Other tools may also be included on Allen Brain Map and all participants agree to have their submissions publicly linked at Allen Brain Map.  ***[NOTE: WE STILL NEED TO ACTUALLY DECIDE ON THE PRIZE. Publication? Presentation? Entry to workshop? Something else?]***

Other possibilities:
*	We will try and design enhancers specifically for the winning group?
*	Just a paper led by the winner on their algorithm?
*	Featuring resources on GTA?
*	Guaranteed entry into a future Allen Institute workshop?
*	Part of a future publication on GTA?


## Background

The [Genetics Tools Atlas](https://portal.brain-map.org/genetic-tools/genetic-tools-atlas) is a searchable web tool representing information and data on enhancer-adeno-associated viruses (enhancer AAVs) and mouse transgenes. The characterization data include Epifluorescence imaging (EPI), Serial Two-Photon Tomography (STPT), and Single Cell/Single Nucleus RNA-sequencing generated at the Allen Institute for Brain Science.  These genetic tools have been published in several peer-reviewed manuscripts, and are largely available on [Addgene](https://www.addgene.org/collections/brain-armamentarium/) (as part of the BRAIN Armamentarium Collection of plasmids and viral preps) or at [The Jackson Laboratory](https://www.jax.org/jax-mice-and-services/find-and-order-jax-mice/most-popular-jax-mice-strains/strain-collections) (transgenic mice).

The [Allen Brain Cell Atlas](https://portal.brain-map.org/atlases-and-data/bkp/abc-atlas) provides a platform for visualizing multimodal single cell data across the mammalian brain and aims to empower researchers to explore and analyze multiple whole-brain datasets simultaneously. This open science resource, developed by the Allen Institute as part of the Brain Knowledge Platform, allows unprecedented insights into the enormous diversity of cell types in the brain and where they are. As the Allen Institute and its collaborators continue to add new modalities, species, and insights to the ABC Atlas, this groundbreaking platform will keep growing, opening up endless possibilities for discoveries and breakthroughs in neuroscience. The ABC Atlas enables the neuroscience community to identify more cell types in the brain, investigate the spatial location of cell types, investigate gene expression and co-expression patterns in cell types, and refine boundaries and knowledge of brain regions defined by gene expression.

Allen Brain Map and BICCN have tools for allowing scientists to compare their gene expression data with cell types in motor cortex ([Azimuth](https://azimuth.hubmapconsortium.org/); accessible via the [Cell Type Knowledge Explorer](https://knowledge.brain-map.org/celltypes)) and spanning the whole brain ([MapMyCells](https://portal.brain-map.org/atlases-and-data/bkp/mapmycells)).  These tools directly transfer (or “map”) cell type assignments to user-provided cells, also allowing a transfer of associated knowledge about that cell type.  For example, cells in motor cortex matching to Pvalb interneurons based on gene expression are also likely to be fast spiking and to have either basket or chandelier morphologies.  Similarly, putative spatial locations can be assigned to a cell collected from a dissociation protocol by mapping it to the whole mouse brain and then seeing where that cell is located using the [Allen Brain Cell Atlas](https://portal.brain-map.org/atlases-and-data/bkp/abc-atlas).  Finally, by mapping cell type assignments to cells collected from individuals with Alzheimer’s disease (e.g., in [SEA-AD](https://portal.brain-map.org/explore/seattle-alzheimers-disease)) and other disorders, scientists can understand which cell types change and how they change in different states.  While other algorithms exist for mapping transcriptomics (and other ‘-omics’) data between reference cell types and query data, Azimuth and MapMyCells are web-based, making them accessible to researchers and students with a wide range of computational and biological competencies.  Last year’s data challenge, [MapMySpikes](https://alleninstitute.org/events/mapmyspikes/), asked participants to accurate make the connection between firing properties of a cell and the cell’s molecular type to relate it to existing knowledge of cell types on Allen Brain Map; otherwise, nearly all web-based mapping algorithms focus on gene expression.  MapMySections, like MapMySpikes, aims to extend the types of experimental data that can be aligned to transcriptomically-defined cell types. 
