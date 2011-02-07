#
# Cookbook Name:: vagrant-helpers
# Recipe:: default
#
# Copyright 2011, Map of Medicine
#

remote_directory "/usr/local/devops" do
  source "devops"
  files_mode "0755"
  mode "0755"
end