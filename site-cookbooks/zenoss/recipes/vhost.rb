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

include_recipe "apache2"

zen_srv = search(:node, "zenoss_server:true").map { |n| n["fqdn"] }.first

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
    notifies :reload, resources(:service => "apache2"), :delayed
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