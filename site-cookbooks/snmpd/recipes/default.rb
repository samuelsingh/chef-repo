#
# Cookbook Name:: snmpd
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

# We should make this more intelligent, so that snmp looks for the Zenoss server corresponding to its domain
monitoring_server = node[:zenoss][:server] ? node[:zenoss][:server] : search(:node, "zenoss_server:true").map { |n| n["ipaddress"] }.first

package "snmpd" do
  case node[:platform]
  when "debian","ubuntu"
    package_name "snmpd"
  end
  action :install
end

service "snmpd"  do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

template "/etc/snmp/snmpd.conf" do
  source "snmpd.conf.erb"
  mode 0600
  owner "root"
  group "root"
  variables(
    :source_ip => monitoring_server,
    :community_string => node[:snmpd][:community],
    :syslocation => node[:snmpd][:syslocation],
    :syscontact => node[:snmpd][:syscontact]
  )
  notifies :reload, resources(:service => "snmpd")
  only_if "test -d /etc/snmp"
end