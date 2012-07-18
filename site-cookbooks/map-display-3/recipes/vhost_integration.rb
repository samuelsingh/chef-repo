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

include_recipe "apache2"

node[:map_display][:vhost_v01].each do |hostname,params|

  if defined?(node[:apache][:dir])

    params["mom_port"].nil? ? mom_port = "9001" : mom_port = params["mom_port"]
    params["aa_port"].nil? ? aa_port = "9002" : aa_port = params["aa_port"]
    
    template "#{node[:apache][:dir]}/sites-available/#{hostname}.conf" do
      source "map-display-vhost_integration.conf.erb"
      mode 0644
      owner "sysadmin"
      group "sysadmin"
      variables(
        :hostname => hostname,
        :srv_aliases => params["srv_aliases"],
        :deploy_dir => params["deploy_dir"],
        :appserver => params["appserver"],
        :restricted_ips => node[:apache][:restricted_ips],
        :holding_page => params["holding_page"],
        :lb_alive_port => params["lb_alive_port"],
        :mom_port => mom_port,
        :aa_port => aa_port
      )
      notifies :reload, resources(:service => "apache2"), :delayed
      only_if "test -d #{node[:apache][:dir]}/sites-available"
    end
    
    link "#{node[:apache][:dir]}/sites-enabled/#{hostname}.conf"  do
      to "#{node[:apache][:dir]}/sites-available/#{hostname}.conf"
    end
    
  end
  
  remote_directory "/var/www/vhosts/#{hostname}" do
    source "docroot"
    files_mode "0644"
    mode "0755"
    recursive true
    not_if "test -d /var/www/vhosts/#{hostname}"
  end
  
  template "/var/www/vhosts/#{hostname}/holding.html" do
    source "holding.html.erb"
    mode 0644
    variables(
        :holding_page_msg => params.fetch("holding_page_msg")
    )
  end
  
  # It would be nice to make this a generic resource, so that if a template
  # of the form <vhost>-aliases.conf was included, it would be picked up, and
  # if not would carry on.  Guess that's for another day.
  
  if hostname == 'app.mapofmedicine.com'
    
    template "#{node[:apache][:dir]}/sites-available/#{hostname}-aliases.conf" do
      source "#{hostname}-aliases.conf.erb"
      mode 0644
      variables(
        :hostname => hostname
      )
      notifies :reload, resources(:service => "apache2"), :delayed
      only_if "test -d #{node[:apache][:dir]}/sites-available"
    end
    
    link "#{node[:apache][:dir]}/sites-enabled/#{hostname}-aliases.conf"  do
      to "#{node[:apache][:dir]}/sites-available/#{hostname}-aliases.conf"
    end
    
  end

end
