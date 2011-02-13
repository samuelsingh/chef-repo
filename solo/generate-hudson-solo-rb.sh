#!/bin/sh

# Dynamically generates a chef-solo script based on Hudson environment
# variables
#

echo "cookbook_path   [ \"$WORKSPACE/chef-repo/site-cookbooks\" ]" > /tmp/solo.rb
echo "role_path \"$WORKSPACE/chef-repo/roles\"" >> /tmp/solo.rb
