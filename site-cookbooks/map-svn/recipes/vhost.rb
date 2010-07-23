#
# Cookbook Name:: map-svn
# Recipe:: vhost
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

service "apache2" do
  case node[:platform]
  when "centos","redhat","fedora","suse"
    service_name "httpd"
    # If restarted/reloaded too quickly httpd has a habit of failing.
    # This may happen with multiple recipes notifying apache to restart - like
    # during the initial bootstrap.
    restart_command "/sbin/service httpd restart && sleep 1"
    reload_command "/sbin/service httpd reload && sleep 1"
  when "debian","ubuntu"
    service_name "apache2"
    # If restarted/reloaded too quickly httpd has a habit of failing.
    # This may happen with multiple recipes notifying apache to restart - like
    # during the initial bootstrap.
    restart_command "/etc/init.d/apache2 restart && sleep 1"
    reload_command "/etc/init.d/apache2 reload && sleep 1"
  end
  supports value_for_platform(
    "debian" => { "4.0" => [ :restart, :reload ], "default" => [ :restart, :reload, :status ] },
    "ubuntu" => { "default" => [ :restart, :reload, :status ] },
    "centos" => { "default" => [ :restart, :reload, :status ] },
    "redhat" => { "default" => [ :restart, :reload, :status ] },
    "fedora" => { "default" => [ :restart, :reload, :status ] },
    "default" => { "default" => [:restart, :reload ] }
  )
  action :enable
end

template "#{node[:apache][:dir]}/sites-available/svn-01.conf" do
  source "svn_vhost.conf.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :name => name,
    :hostname => node[:map_svn][:vhost][:hostname],
    :srv_aliases => node[:map_svn][:vhost][:srv_aliases],
    :restricted_ips => node[:apache][:restricted_ips],
    :svn_root => node[:map_svn][:svn_root],
    :svn_repos => node[:map_svn][:svn_repos],
    :ldap_host => node[:map_svn][:ldap][:server],
    :ldap_port => node[:map_svn][:ldap][:port],
    :ldap_path => node[:map_svn][:ldap][:url_path],
    :ldap_binddn => node[:map_svn][:ldap][:binddn],
    :ldap_bindpassword => node[:map_svn][:ldap][:bindpassword]
  )
  notifies :reload, resources(:service => "apache2")
  only_if "test -d #{node[:apache][:dir]}/sites-available"
end
  
link "#{node[:apache][:dir]}/sites-enabled/#{node[:map_svn][:vhost][:hostname]}.conf"  do
  to "#{node[:apache][:dir]}/sites-available/#{node[:map_svn][:vhost][:hostname]}.conf"
end
  
directory "/var/www/vhosts/#{node[:map_svn][:vhost][:hostname]}" do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  recursive true
end

