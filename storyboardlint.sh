#!/bin/sh

#  storyboardlint.sh
#  XcodeBuildScripts
#
#  Created by Ben Chatelain on 2015-05-01.
#  Copyright (c) 2015 Ben Chatelain. All rights reserved.

if [ "$USER" == "_teamsserver" ]; then
    exit
fi

# Add rbenv gem folder to path
PATH=${PATH}:/usr/local/var/rbenv/shims:/opt/boxen/rbenv/shims

which storyboardlint
which -s storyboardlint
if [[ $? != 0 ]] ; then
    echo "warning: storyboardlint gem is not installed"
    exit
fi

storyboardlint "${SRCROOT}/${PROJECT_NAME}" \
    --storyboard-prefix FFStoryboardID_ \
    --segue-prefix FFSegueID_ \
    --reuse-prefix FFCellReuseID_
