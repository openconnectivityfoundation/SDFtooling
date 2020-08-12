# SDF tooling

This repository contains scripts to convert from:

- OpenAPI modeling to SDF (oas2sdf)
- SDF to OpenAPI modeling (sdf2oas)
- SDF to AsyncAPI modeling (sdf2async)

OCF is using OpenAPI specification (OAS2.0) as data modeling language.
SDF is a new modeling language defined in https://github.com/one-data-model/SDF.

SDF is machine-readable (e.g. it is using JSON formatting),
therefore it is possible to convert the data models defined in OpenAPI to SDF. Since SDF is indented to use as generic conversion format, SDF can be converted to OAS2.0 and AsyncAPI2.0.0.

## Open API

Open API is a API description format intended for rest full environments.
More info to be found at:
https://www.openapis.org/
Note that OCF is using Open Api Specification format 2.0, in JSON.

## AsyncAPI

AsyncAPI is a API description format intended for event driven environments (e.g. publish subscribe).
More info to be found at:
https://www.asyncapi.com/

At this moment in time OCF is not using a pubsub mechanism. This code is made available so that OCF models (in SDF format) can be used in combination with MQTT/AMQP.

## Provided scripts

The provided tooling consist of the following scripts

- convert_oas2sdf.sh - open api to SDF conversion
- convert_sdf2oas.sh - SDF to open API specification
- convert_sdf2async.sh - SDF to AsyncAPI specification
- setup_repos.sh - script to set up the local folder structure

## Usage

The provided script are working from local folders.
Steps to use the scripts are:

- Clone this repo
  - Run the script 'setup_repos.sh'
      The script downloads all other used repos.
- Run one of the convert scripts, depending on the usage

## Folder structure

The folder structure which is created by the setup_repos script is as follows:

     TopFolder |
               |-- SDFtooling repository         this repo
               |
               |-- playground repository         SDF repo playground, 
               |                                 containing informal contributed SDF files 
               |
               |-- IoTDataModels repository      OCF repo IOTDataModels, 
               |                                 containing OAS2.0 files that are part 
               |                                 of the specification
               |-- swagger2x repository          The conversion tool

The conversion scripts can be executed from a command line (BASH).
The following folder structure will be created with the converted files

     TopFolder |
               |- SDFtooling repository         this repo
                      |
                      |- oas2sdf_for_playground
                      |         folder that will be created when running convert_oas2sdf.sh script
                      |         it will contain the SDF files converted from OAS2.0 
                      |         The input OAS2.0 files are from ../IOTDataModels
                      |         note: not all OAS2.0 can be converted, the converted files is a subset
                      |
                      |- sdf2oas_from_sdf_playground
                      |         folder that will be created when running 
                      |         the convert_sdf2oas.sh script
                      |         it will contain the OAS2.0 files converted from SDF 
                      |         The input SDF files are from ../playground/odmObjects
                      |- sdf2async_from_sdf_playground
                                folder that will be created when running the convert_sdf2async.sh script
                                it will contain the AsyncAPI2.0.0 files converted from SDF 
                                The input SDF files are from ../playground/odmObjects
                               