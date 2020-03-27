# SDF tooling

This repository contains script to convert from 
- OCF modeling to SDF (oas2sdf)
- SDF to OCF modeling (sdf2oas)

OCF is using OpenAPI specification (OAS2.0) as data modeling language.
SDF is a new modeling language defined in https://github.com/one-data-model/language

This new language is machine readable (e.g. it is using JSON formatting).
Therefore it is possible to convert the data models of OCF in this language.
Also data models in SDF can be converted to OAS2.0.

The provided tooling consist of the following scripts
- convert_oas2sdf.sh
- convert_sdf2oas.sh
- setup_repos.sh

The folder structure which is created by the setup_repos script is as follows:

     TopFolder |
               |- SDtooling repository          this repo
               |
               |- playground repository         SDF repo playground, 
               |                                containing informal contributed SDF files 
               |
               |- IoTDataModels repository      OCF repo IOTDataModels, 
                                                containg OAS2.0 files that are part 
                                                of the specification
        
     TopFolder |
               |- SDtooling repository          this repo
                      |
                      |- oas2sdf_for_playground
                      |         folder that will be created when running convert_oas2sdf.sh script
                      |         it will contain the SDF files converted from OAS2.0 
                      |         The input OAS2.0 files are from ../IOTDataModels
                      |         note: not all OAS2.0 can be converted, the converted files is a subset
                      |
                      |- sdf2oas_from_sdf_playground
                                folder that will be created when running the convert_sdf2oas.sh script
                                it will contain the OAS2.0 files converted from SDF 
                                The input SDF.0 files are from ../playground/odmObjects
                               