#!/bin/bash -e

#  cocoapods.sh
#  XcodeBuildScripts
#
#  Created by Ben Chatelain on 2015-05-01.
#  Copyright (c) 2015 Ben Chatelain. All rights reserved.

export LC_ALL="en_US.UTF-8"
PATH=${PATH}:/usr/local/var/rbenv/shims

which pod
which -s pod || (echo "error: cocoapods is not installed" && false)

pod "$@"
