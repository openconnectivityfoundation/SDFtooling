#!/bin/bash
set -x #echo on
#############################
#
# copyright 2018 Open Connectivity Foundation, Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#############################

PYTHON_EXE=python3

SWAGGER2XDIR=../swagger2x
SWAGGER2X=$SWAGGER2XDIR/src/swagger2x.py
OUTPUTDIR=./sdf2async_from_sdf_playground
DEVICETYPE=MYDEVICETYPE


echo "" > sdf2async-output.txt
mkdir -p $OUTPUTDIR

#for file in ../playground/sdfObject/*airqu*
#for file in ../playground/sdfObject/*hvac_capacity*
for file in ../playground/sdfObject/*
do
    if [[ -f $file ]]; then
        myfile=$(basename "$file" | cut -d. -f1)
        echo $myfile
        # do the actual conversion
        $PYTHON_EXE $SWAGGER2X -template_dir $SWAGGER2XDIR/src/templates -template SDF2AsyncAPI -swagger $file -out_dir $OUTPUTDIR -jsonindent 2 -devicetype $DEVICETYPE -prefix_file $myfile |tee -a sdf2async-output.txt 2>&1
        
        # convert to yaml
        #json2yaml $OUTPUTDIR/$myfile.async.json $OUTPUTDIR/$myfile.async.yaml |tee -a sdf2async-output.txt 2>&1
        #ag $OUTPUTDIR/$myfile.async.yaml @asyncapi/html-template |tee -a sdf2async-output.txt 2>&1
        
        # verify if the output files are correct
        spectral lint $OUTPUTDIR/${myfile}publisher.async.json |tee -a sdf2async-output.txt 2>&1
        spectral lint $OUTPUTDIR/${myfile}subscriber.async.json |tee -a sdf2async-output.txt 2>&1
        spectral lint $OUTPUTDIR/${myfile}pubsub.async.json |tee -a sdf2async-output.txt 2>&1
        
#                $PYTHON_EXE $SWAGGER2X -template_dir $SWAGGER2XDIR/src/templates -template SDF2AsyncAPI -swagger $file -out_dir $OUTPUTDIR  -jsonindent 2 -devicetype $DEVICETYPE -output_file $myfile.async.json |tee -a sdf2async-output.txt 2>&1
                
        #wb-swagger validate $OUTPUTDIR/$myfile.swagger.json |tee -a sdf2async-output.txt 2>&1
    fi
done

