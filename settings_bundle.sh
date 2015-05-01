#!/bin/sh

#  settings_bundle.sh
#  XcodeBuildScripts
#
#  Created by Ben Chatelain on 2015-05-01.
#  Copyright (c) 2015 Ben Chatelain. All rights reserved.

echo "CONFIGURATION: ${CONFIGURATION}"

source_path="${PROJECT_DIR}/${TARGET_NAME}/Resources/Settings-${CONFIGURATION}.bundle"
destination_path="${BUILT_PRODUCTS_DIR}/${WRAPPER_NAME}/Settings.bundle"

echo "Copying settings bundle into the target bundle"
ditto -V "${source_path}" "${destination_path}"
