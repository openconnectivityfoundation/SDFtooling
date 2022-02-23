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

ORGDIR=`pwd`
cd ..
git clone https://github.com/openconnectivityfoundation/IoTDataModels.git --branch master
cd $ORGDIR

ORGDIR=`pwd`
cd ..
git clone https://github.com/openconnectivityfoundation/swagger2x.git --branch master
cd $ORGDIR


SWAGGER2XDIR=../swagger2x
SWAGGER2X=$SWAGGER2XDIR/src/swagger2x.py
OUTPUTDIR=./oas2sdf_for_playground
DEVICETYPE=MYDEVICETYPE

echo "" > oas2sdf-output.txt
mkdir -p $OUTPUTDIR

for file in ../IoTDataModels/*.swagger.json
do
    if [[ -f $file ]]; then
        myfile=$(basename "$file" | cut -d. -f1)
        echo $myfile
        echo "============" >> out-2sdf.txt
        echo "============" >> out-2sdf.txt
        echo "============" >> out-2sdf.txt
        echo $myfile >> oas2sdf-output.txt
        echo $myfile.sdf.json >> oas2sdf-output.txt
        $PYTHON_EXE $SWAGGER2X -template_dir $SWAGGER2XDIR/src/templates -template OAS2SDF -swagger $file -out_dir $OUTPUTDIR  -jsonindent 2 -output_file auto >> oas2sdf-output.txt 2>&1
        
    fi
done

exit

for file in $OUTPUTDIR/*.sdf.json
do
    if [[ -f $file ]]; then
        myfile=$(basename "$file" | cut -d. -f1)
        echo $myfile
        echo "=====================" >> oas2sdf-output.txt
        echo "---------------------" >> oas2sdf-output.txt
        echo "=====================" >> oas2sdf-output.txt

        
        $PYTHON_EXE $SWAGGER2X -template_dir $SWAGGER2XDIR/src/templates -template SDF2OAS -swagger $OUTPUTDIR/SDF-files/$myfile.sdf.json -out_dir $OUTPUTDIR/code  -jsonindent 2  -output_file $myfile.swagger.json >> out-2sdf.txt 2>&1
        
        echo "======-------------======" >> oas2sdf-output.txt
        echo $myfile >> oas2sdf-output.txt
        echo $myfile.sdf.json >> oas2sdf-output.txt
        echo $myfile.swagger.json >> oas2sdf-output.txt
        wb-swagger validate $OUTPUTDIR/code/$myfile.swagger.json >> oas2sdf-output.txt 2>&1
    fi
done

