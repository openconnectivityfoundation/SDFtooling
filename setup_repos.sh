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


#
# go one folder up, so that the repos are placed on the same level
#
CURPWD=`pwd`
cd ..

#
# clone the repo of swagger2x, e.g. the conversion tool
#
git clone https://github.com/openconnectivityfoundation/swagger2x.git


#
# clone the repo of OCF data models 
#
git clone https://github.com/openconnectivityfoundation/IoTDataModels.git

#
# clone the repo of SDF - playground e.g. the input data
#
git clone https://github.com/one-data-model/playground.git

cd $CURPWD

