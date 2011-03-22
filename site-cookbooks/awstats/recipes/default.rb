#
# Cookbook Name:: awstats
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

include_recipe "apache2"

log_base = "/var/shared/rotated-logs"
hostname = "awstats.map-cloud-01.eu"
vhosts = Array.new

package "awstats" do
  case node[:platform]
  when "debian","ubuntu"
    package_name "awstats"
  end
  action :install
end

node[:awstats].each do |vhost,params|
  
  template "/etc/awstats/awstats.#{vhost}.conf" do
    source "awstats.conf.template.erb"
    mode 0644
    owner "sysadmin"
    group "sysadmin"
    variables(
      :vhost => vhost,
      :host_regex => params.fetch("host_regex"),
      :log_base => log_base
    )
    only_if "test -d /etc/awstats"
  end

  # Cron doesn't like filenames containing .
  template "/etc/cron.d/awstats-#{vhost.gsub('.','-')}" do
    source "awstats-cron-template.erb"
    mode 0644
    owner "root"
    group "root"
    variables(
      :vhost => vhost
    )
  end
  
  vhosts << vhost

end

template "#{node[:apache][:dir]}/sites-available/#{hostname}.conf" do
  source "awstats-server-vhost.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :hostname => hostname
  )
  notifies :reload, resources(:service => "apache2"), :delayed
  only_if "test -d #{node[:apache][:dir]}/sites-available"
end

link "#{node[:apache][:dir]}/sites-enabled/#{hostname}.conf"  do
  to "#{node[:apache][:dir]}/sites-available/#{hostname}.conf"
end



remote_directory "/var/www/awstats" do
  source "www"
  files_backup 0
  files_owner "root"
  files_group "root"
  files_mode "0644"
  owner "root"
  group "root"
  mode "0755"
end

template "/var/www/awstats/top.html" do
  source "top.html.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :vhosts => vhosts
  )
  only_if "test -d /var/www/awstats"
end
