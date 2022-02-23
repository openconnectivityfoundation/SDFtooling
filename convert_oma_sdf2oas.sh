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
OUTPUTDIR=./oma_oas
DEVICETYPE=MYDEVICETYPE


ORGDIR=`pwd`
cd ..
git clone https://github.com/one-data-model/oma-models.git --branch main
cd $ORGDIR

echo "" > sdf2oas-output.txt
mkdir -p $OUTPUTDIR

#for file in ../oma-models/sdfObject/*acc*
for file in ../oma-models/sdfObject/*
do
    if [[ -f $file ]]; then
        myfile=$(basename "$file" | cut -d. -f1)
        echo $myfile
        $PYTHON_EXE $SWAGGER2X -template_dir $SWAGGER2XDIR/src/templates -template SDF2OAS -swagger $file -out_dir $OUTPUTDIR  -jsonindent 2 -devicetype $DEVICETYPE -output_file $myfile.swagger.json |tee -a sdf2oas-output.txt 2>&1
        wb-swagger validate $OUTPUTDIR/$myfile.swagger.json |tee -a sdf2oas-output.txt 2>&1
    fi
done

