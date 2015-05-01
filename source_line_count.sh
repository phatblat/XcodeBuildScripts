#!/bin/sh

#  source_line_count.sh
#  XcodeBuildScripts
#
#  http://matthewmorey.com/xcode-build-phases/
#
#  Created by Ben Chatelain on 2015-05-01.
#  Copyright (c) 2015 Ben Chatelain. All rights reserved.

find "${SRCROOT}/${PROJECT_NAME}" "${SRCROOT}/${PROJECT_NAME}Tests" \( -name "*.h" -or -name "*.m" \) -print0 | \
	xargs -0 cat | \
	wc -l
