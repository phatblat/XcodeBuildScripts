#!/usr/bin/env ruby

#  crashlytics.rb
#  XcodeBuildScripts
#
#  Created by Ben Chatelain on 2015-05-01.
#  Copyright (c) 2015 Ben Chatelain. All rights reserved.

# Alternate values make much of this script testable from outside Xcode
if ARGV.length > 0
  args = ARGV.join(" ")
else
  args = "efe0ae2505627fce961787a26526665285f638f1 95c509d04265ac2ea05376e26d5183f71f38e2a3369b687751f84bcd70602ec2"
end

framework_search_paths = ENV['FRAMEWORK_SEARCH_PATHS'] ||= "/Users/ben/Library/Developer/Xcode/DerivedData/Firefly-cuondekpaqyydfbwvnjpdwtgrucj/Build/Products/Debug-iphoneos  \"/Users/admin/workspace/kp-Firefly/XcodeAppName/Xcode5/XcodeScheme/Firefly Debug/node/mobot2/Pods/CrashlyticsFramework\" /Users/ben/dev/ios/firefly"
pod_name = "CrashlyticsFramework"
pod_home = nil # Path to the root of the pod

# Get current path to the crashlytics pod using FRAMEWORK_SEARCH_PATHS,
# making sure break it up on unquoted spaces
framework_search_paths.scan(/(?:"(?:\\.|[^"])*"|[^" ])+/).each { |path|
  # Strip quotes off path
  path = path.chomp('"').reverse.chomp('"').reverse
  if path.end_with?(pod_name)
    pod_home = path
  end
}

run_cmd = "#{pod_home}/Crashlytics.framework/run"
system "\"#{run_cmd}\" #{args} || echo \"warning: Crashlytics dSYM upload failed\""
