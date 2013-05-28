#!/bin/sh

# Copyright (C) 2013 The CyanogenMod Project
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

# This file is generated by device/common/generate-blob-scripts.sh - DO NOT EDIT

VENDOR=htc
DEVICE=m7

mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary

adb root
adb wait-for-device

echo "Pulling proprietary files..."
for FILE in `cat ../$DEVICE/proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d ../../../vendor/$VENDOR/$DEVICE/proprietary/$DIR ]; then
        mkdir -p ../../../vendor/$VENDOR/$DEVICE/proprietary/$DIR
    fi
    adb pull /$FILE ../../../vendor/$VENDOR/$DEVICE/proprietary/$FILE
done

./../../../device/${VENDOR}/${DEVICE}/setup-makefiles.sh

./../../../device/${VENDOR}/${DEVICE}-common/extract-files.sh
