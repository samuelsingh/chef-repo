#
# Cookbook Name:: mms
# Recipe:: hudson-vars
#
# Copyright 2011, Map of Medicine
#

# Used to set up env variables for use by Hudson

include_recipe "mms"

template "/tmp/mms-vars.sh" do
  source "hudson-vars/mms-vars.sh.erb"
  mode 0644
  variables(
    :dbuser => node[:mms][:application][:mom][:dbuser],
    :dbpass => node[:mms][:application][:mom][:dbpass],
    :dbhost => node[:mms][:application][:mom][:dbhost],
    :dbname => node[:mms][:application][:mom][:dbname]
  )
end