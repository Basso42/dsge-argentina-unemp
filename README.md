# Assessing the Phillips curve strength in the early 2000 Argentinian economy
Project for the applied macroeconomics exam, course taught by G. Vermandel and P-L. Girard.
Leveraging Dynare and DBNomics, we developed a DSGE model to study the expected effects of a tight monetary policy on the argentinian economy. 

## Using the repository
To run the full models and obtain all the results in one click, one can run the file `one_runs_all.m` available in the main folder.

The rest of the repository is organized in four subfolders.
- **functions**: contains the data scrapping functions (`call_dbnomics.m` and `call_worldbank.m` that respectively scrap from https://db.nomics.world/ and the World Bank database) and the data set generation that are used in the estimation (`data_argentina.m`)
- **model**: contains the stochastic simulation of the theoretical model rederived by N. STIZI (`unemp_argentina_baseline`) and the estimations of this model on Argentinan data from 2000 to 2023 (`unemp_argentina_estim_all`) and on the subsample from 2000 to 2005 to analyse the specific high inflation event of 2001-2002 (`unemp_argentina_estim_2000_2005`).
- **results**: contains the graphs and tables output of the stochastic simulations (baseline and estimates) as LaTeX output.
- **documentation**: gives the reference note from Gauthier Vermandel used as a base before rederiving the model and tailoring it to Argentina, free of environmental consideration.


## Project Flowchart

```mermaid
flowchart TB

%% External Data Sources
subgraph "External Data Sources"
    DBN["DBNomics API"]:::external
    WB["World Bank API"]:::external
end

%% Data Ingestion Layer
subgraph "Data Ingestion Layer"
    CDB["call_dbnomics.m"]:::code
    CWB["call_worldbank.m"]:::code
    DAG["data_argentina.m"]:::code
end

%% Data Storage
subgraph "Data Storage"
    DATA["data/"]:::datastore
    DREADME["data/ReadMe.md"]:::datastore
end

%% Modeling Engine
subgraph "Modeling Engine (Dynare)"
    M1["unemp_argentina_baseline.mod"]:::code
    M2["unemp_argentina_estim_all.mod"]:::code
end

%% Output Generator
subgraph "Output Generator"
    FIG["data_series_fig.eps"]:::output
end

%% Documentation
subgraph "Documentation"
    DOC["unemployment_vermandel.pdf"]:::doc
end

%% Project Metadata
subgraph "Project Metadata"
    RMD["README.md"]:::datastore
    LIC["LICENSE"]:::datastore
    GIT[".gitignore"]:::datastore
end

%% Data Flows
DBN -->|fetch data| CDB
WB -->|fetch data| CWB
CDB -->|store series| DATA
CWB -->|store series| DATA
DAG -->|prepare Argentina| DATA
DATA -->|read input| M1
DATA -->|read input| M2
M1 -->|run Dynare| FIG
M2 -->|run Dynare| FIG
DOC -->|speficies| M1
DOC -->|specifies| M2

%% Click Events
click CDB "https://github.com/basso42/dsge-argentina-unemp/blob/main/functions/call_dbnomics.m"
click CWB "https://github.com/basso42/dsge-argentina-unemp/blob/main/functions/call_worldbank.m"
click DAG "https://github.com/basso42/dsge-argentina-unemp/blob/main/functions/data_argentina.m"
click DATA "https://github.com/basso42/dsge-argentina-unemp/tree/main/data/"
click DREADME "https://github.com/basso42/dsge-argentina-unemp/blob/main/data/readme.md"
click M1 "https://github.com/basso42/dsge-argentina-unemp/blob/main/model/unemp_argentina_estim_2000_2005.mod"
click M2 "https://github.com/basso42/dsge-argentina-unemp/blob/main/model/unemp_argentina_estim_2020_2024.mod"
click FIG "https://github.com/basso42/dsge-argentina-unemp/blob/main/results/data_series_fig.eps"
click DOC "https://github.com/basso42/dsge-argentina-unemp/blob/main/documentation/unemployment_vermandel.pdf"
click RMD "https://github.com/basso42/dsge-argentina-unemp/blob/main/README.md"
click LIC "https://github.com/basso42/dsge-argentina-unemp/tree/main/LICENSE"
click GIT "https://github.com/basso42/dsge-argentina-unemp/blob/main/.gitignore"

%% Styles
classDef external fill:#ADD8E6,stroke:#000,color:#000
classDef code fill:#98FB98,stroke:#000,color:#000
classDef datastore fill:#FFFACD,stroke:#000,color:#000
classDef output fill:#FFDAB9,stroke:#000,color:#000
classDef doc fill:#FFA500,stroke:#000,color:#000
