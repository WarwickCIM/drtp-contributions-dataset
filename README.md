# Mapping Digital Research Competencies Pedagogies Survey Dataset

Anonymised datasets and data components derived from Mapping Digital Research Competencies Pedagogies Survey, ran between May 2026 and XXX (see details below).

This is an output of the research project "[Mapping and evaluating dRTP’s contributions to computing skills pedagogies in HE](https://warwick.ac.uk/fac/cross_fac/cim/research/projects/mapping-drtp-contributions/)" led by Dr. Carlos Cámara-Menoyo and Dr. Timothy Monteath, from the Centre for Interdisciplinary Methodologies at the University of Warwick, and aimed at mapping and analysing the provision of digital research competencies (DRP) across higher education institutions, producing a publicly accessible repository to inform decision-making around teaching and curriculum design in a rapidly evolving landscape shaped by AI adoption.

This repository contains the following components:

1.  **Respondents dataset** with survey responses describing the respondents. The dataset is a `csv` file containing XX observations and YY variables.
2.  **Trainings dataset** with information about different training courses and role played by the drtp. The dataset is a `csv`file containing 65 observations and 39 variables.
3.  **Dataset Metadata**, stored in human-readable format in this website, and machine-readable format stored in `data/metadata/dataspice.json` (NOT IMPLEMENTED YET)
4.  **Scripts** used to generate the resulting dataset after cleaning and anonymising the raw data from qualtrics (not included), to allow scrutiny.
5.  **PDF copy of the original survey**.

You are free to reuse this dataset under the Licence conditions. If you use this dataset in your work, please cite it as below:

> Cámara-Menoyo, C., & Monteath, T. (2025). **Mapping Digital Research Competencies Pedagogies Survey Dataset** [Dataset]. <https://github.com/WarwickCIM/drtp-contributions-dataset>. [https://doi.org/](https://doi.org/10.17605/OSF.IO/GX7ME){.uri}xxxxxx

For your convenience, we have also included a `CITATION.bib` file you may want to use to import it to your Reference Manager.

``` bibtex
@dataset{

}
```

## About the survey

The survey was aimed to to better understand the role played by people, methodologies and infrastructure in the provision of digital research competencies (DRP) across higher‑education institutions. The findings will offer evidence‑based recommendations for policymakers, dRTPs and educators to enhance DRP curricula across HE, guiding when and how to involve specialist trainers and applying appropriate pedagogical approaches and tools for different contexts.

### Audience

The survey is for people, based in the UK, who self-identify as a digital Research Technical Professional in HE. We use "dRTP" as an inclusive and open term to refer to the wide range of professionals whose work supports, enables, or advances research through digital tools, data, infrastructure, or technical expertise. For more information, refer to <https://discourse-network.github.io/who>

## Acknowledgements

This work was supported by the [DisCouRSE Network+](https://discourse-network.github.io/), which received funding through the UKRI Digital Research Infrastructure Programme.

![](https://discourse-network.github.io/assets/images/DisCouRSE-Logo-Light.svg)

## Installation

If you just want to use the data, there's no need to install anything. You can navigate through the files within `data/` folder and download them from there, or from the public website.

If you are interested in running the code to replicate this repo, you will need to:

1.  Clone this repo `git clone git@github.com:WarwickCIM/drtp-contributions-dataset.git`
2.  Install dependencies running `automagic::automagic()` (if you don't have automatic installed, you'll need to install it beforehand with `install.packages('automagic')` )
