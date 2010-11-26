#
# Cookbook Name:: sonar
# Recipe:: default
#
# Copyright 2010, Map of Medicine
#

include_recipe "mysql::server"

sonar_home = node[:sonar][:home]
war_file = node[:sonar][:war]
war_path = "#{sonar_home}/wars/#{war_file}"

# Creates directory structure
#
directory "#{sonar_home}" do
  mode "0755"
  action :create
  only_if "test -b /dev/sdh1"
end

directory "#{sonar_home}/mysql" do
  owner "mysql"
  group "mysql"
  mode "0755"
  action :create
  only_if "test -b /dev/sdh1"
end

directory "#{sonar_home}/wars" do
  mode "0755"
  action :create
  only_if "test -b /dev/sdh1"
end

# Deploy Sonar warfile
#
#remote_file war_path do
#  source war_file
#  backup false
#  mode "0644"
#  not_if "test -f #{war_path}"
#end

