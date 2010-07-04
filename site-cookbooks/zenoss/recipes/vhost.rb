#
# Cookbook Name:: zenoss
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

zen_srv = search(:node, "zenoss_server:true").map { |n| n["fqdn"] }.first

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

if defined?(node[:apache][:dir])
  
  hostname = node[:zenoss][:vhost][:hostname]
  
  template "#{node[:apache][:dir]}/sites-available/#{hostname}.conf" do
    source "zenoss-vhost.conf.erb"
    mode 0644
    owner "sysadmin"
    group "sysadmin"
    variables(
      :hostname => hostname,
      :appserver => zen_srv,
      :srv_aliases => node[:zenoss][:vhost][:srv_aliases],
      :restricted_ips => node[:apache][:restricted_ips]
    )
    notifies :reload, resources(:service => "apache2")
    only_if "test -d #{node[:apache][:dir]}/sites-available"
  end
  
  link "#{node[:apache][:dir]}/sites-enabled/#{hostname}.conf"  do
    to "#{node[:apache][:dir]}/sites-available/#{hostname}.conf"
  end
  
end

directory "/var/www/vhosts/#{hostname}" do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  recursive true
end