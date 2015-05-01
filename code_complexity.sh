#!/bin/sh

#  code_complexity.sh
#  XcodeBuildScripts
#
#  http://matthewmorey.com/xcode-build-phases/
#
#  Created by Ben Chatelain on 2015-05-01.
#  Copyright (c) 2015 Ben Chatelain. All rights reserved.

find "${SRCROOT}/${PROJECT_NAME}" "${SRCROOT}/${PROJECT_NAME}Tests" \( -name "*.h" -or -name "*.m" \) -print0 | \
	xargs -0 wc -l | \
	awk '$1 > 400 && $2 != "total" { print $2 ":1: warning: File more than 400 lines, consider refactoring." }'
