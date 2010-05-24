#
# Cookbook Name:: map-display-vhost
# Recipe:: default
#
# Copyright 2010, Map of Medicine
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

hostname = node[:map_display_vhost][:hostname]
srv_aliases = node[:map_display_vhost][:srv_aliases]
deploy_dir = node[:map_display_vhost][:deploy_dir]
appserver = node[:map_display_vhost][:appserver]
tomcat_mgr_ips = node[:map_display_vhost][:tomcat_mgr_ips]
holding_page = node[:map_display_vhost][:holding_page]
is_load_balanced = node[:map_display_vhost][:is_load_balanced]

if defined?(node[:apache][:dir])
  
  template "#{node[:apache][:dir]}/sites-available/#{hostname}.conf" do
    source "map-display-vhost.conf.erb"
    mode 0644
    owner "sysadmin"
    group "sysadmin"
    variables(
      :hostname => hostname,
      :srv_aliases => srv_aliases,
      :deploy_dir => deploy_dir,
      :appserver => appserver,
      :tomcat_mgr_ips => tomcat_mgr_ips,
      :holding_page => holding_page,
      :is_load_balanced => is_load_balanced
    )
    only_if "test -d #{node[:apache][:dir]}/sites-available"
  end
  
  link "#{node[:apache][:dir]}/sites-enabled/#{hostname}.conf"  do
    to "#{node[:apache][:dir]}/sites-available/#{hostname}.conf"
  end
  
end

remote_directory "/var/www/vhosts/#{hostname}" do
  source "docroot"
  files_owner "sysadmin"
  files_group "sysadmin"
  files_mode "0644"
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  recursive true
end

template "/var/www/vhosts/#{hostname}/holding.html" do
  source "holding.html.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
end

service "apache2" do
  action :reload
end