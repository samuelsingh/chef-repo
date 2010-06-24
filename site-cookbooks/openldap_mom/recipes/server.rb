#
# Cookbook Name:: openldap
# Recipe:: server
#
# Copyright 2008-2009, Opscode, Inc.
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
include_recipe "openldap_mom::client"

case node[:platform]
when "debian","ubuntu"
  remote_file "/var/tmp/slapd.seed" do
    source "slapd.seed"
    mode 0600
    owner "root"
    group "root"
  end
end

package "db4.7-util" do
  action :upgrade
end

remote_file "/var/tmp/slapd.seed" do
  source "slapd.seed"
  mode 0600 
  owner "root"
  group "root"
end

package "slapd" do
  case node[:platform]
  when "debian","ubuntu"
    response_file "/var/tmp/slapd.seed"
  end
  action :upgrade
end

script "update apt repo for gosa" do 
  interpreter "bash"
  user "root"
  code <<-EOF
  echo "deb http://oss.gonicus.de/pub/gosa/debian-etch/ ./" >> /etc/apt/sources.list
  apt-get update
  EOF
end

package "gosa" do
  case node[:platform]
  when "debian","ubuntu"
  end
  action :upgrade
  options "--allow-unauthenticated"
end

package "gosa-schema" do
  case node[:platform]
  when "debian","ubuntu"
  end
  action :upgrade
  options "--allow-unauthenticated"
end

#remote_file "#{node[:openldap][:ssl_dir]}/#{node[:openldap][:server]}.pem" do
 # source "ssl/#{node[:openldap][:server]}.pem"
 # mode 0644
 # owner "root"
 # group "root"
#end

service "slapd" do
  action [:enable, :start]
end

case node[:lsb][:codename]
when "intrepid","jaunty"
  template "/etc/default/slapd" do
    source "default_slapd.erb"
    owner "root"
    group "root"
    mode 0644
  end

  directory "#{node[:openldap][:dir]}/slapd.d" do
    recursive true
    owner "openldap"
    group "openldap"
    action :create
  end
  
#  execute "slapd-config-convert" do
#   command "slaptest -f #{node[:openldap][:dir]}/slapd.conf -F #{node[:openldap][:dir]}/slapd.d/"
#   user "openldap"
#   action :nothing
#   notifies :start, resources(:service => "slapd"), :immediately
# end
  
  template "#{node[:openldap][:dir]}/slapd.conf" do
    source "slapd.conf.erb"
    mode 0640
    owner "openldap"
    group "openldap"
    notifies :stop, resources(:service => "slapd"), :immediately
#    notifies :run, resources(:execute => "slapd-config-convert")
  end
else
  case node[:platform]
  when "debian","ubuntu"
    template "/etc/default/slapd" do
      source "default_slapd.erb"
      owner "root"
      group "root"
      mode 0644
    end
  end
  
  template "#{node[:openldap][:dir]}/slapd.conf" do
    source "slapd.conf.erb"
    mode 0640
    owner "openldap"
    group "openldap"
    notifies :restart, resources(:service => "slapd")
  end
end

