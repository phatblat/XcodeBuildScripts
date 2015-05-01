#!/bin/sh

#  todos_as_warnings.sh
#  XcodeBuildScripts
#
#  http://matthewmorey.com/xcode-build-phases/
#
#  Created by Ben Chatelain on 2015-05-01.
#  Copyright (c) 2015 Ben Chatelain. All rights reserved.

KEYWORDS="TODO:|FIXME:|HACK:|\?\?\?:|\!\!\!:"
find "${SRCROOT}/${PROJECT_NAME}" "${SRCROOT}/${PROJECT_NAME}Tests" \( -name "*.h" -or -name "*.m" \) -print0 | \
	xargs -0 egrep --with-filename --line-number --only-matching "($KEYWORDS).*\$" | \
	perl -p -e "s/($KEYWORDS)/ warning: \$1/"
