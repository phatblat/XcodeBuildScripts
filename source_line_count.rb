#!/usr/bin/env ruby

#  source_line_count.rb
#  XcodeBuildScripts
#
#  http://matthewmorey.com/xcode-build-phases/
#
#  Created by Ben Chatelain on 2015-05-01.
#  Copyright (c) 2015 Ben Chatelain. All rights reserved.

# Swift
system("echo -n \"Swift: \"")
system("find \"${SRCROOT}/${PROJECT_NAME}\" \"${SRCROOT}/${PROJECT_NAME}Tests\" "\
       "-name \"*.swift\" -print0 | "\
       "xargs -0 cat | "\
       "wc -l")

# Objective-C
system("echo -n \"Objective-C: \"")
system("find \"${SRCROOT}/${PROJECT_NAME}\" \"${SRCROOT}/${PROJECT_NAME}Tests\" "\
       "-name \"*.h\" -or -name \"*.m\" -print0 | "\
       "xargs -0 cat | "\
       "wc -l")
