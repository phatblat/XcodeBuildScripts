#!/bin/sh -e

#  mogenerator.sh
#  XcodeBuildScripts
#
#  Created by Ben Chatelain on 2015-05-01.
#  Copyright (c) 2015 Ben Chatelain. All rights reserved.

# Add homebrew bin folder to path
PATH=${PATH}:/usr/local/bin:/opt/boxen/homebrew/bin

which -s mogenerator || (echo "error: mogenerator is not installed" && false)

mogenerator \
    --model "${PROJECT_NAME}/event-app-common/Model/event-app.xcdatamodeld" \
    --human-dir "${PROJECT_NAME}/event-app-common/Model/Managed Objects" \
    --machine-dir "${PROJECT_NAME}/event-app-common/Model/Managed Objects/_Generated" \
    --template-path "${PROJECT_NAME}/event-app-common/Model/Mogenerator Templates" \
    --template-var arc=true
