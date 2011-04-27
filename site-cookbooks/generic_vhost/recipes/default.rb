#
# Cookbook Name:: generic-vhost
# Recipe:: default
#
# Copyright 2010, Map of Medicine
#

include_recipe "apache2"

node[:generic_vhost].each do |hostname,params|

  if defined?(node[:apache][:dir])
    
    template "#{node[:apache][:dir]}/sites-available/#{hostname}.conf" do
      source "#{hostname}.conf.erb"
      mode 0644
      owner node[:apache][:user]
      group node[:apache][:group]
      variables(
        :hostname => hostname,
        :srv_aliases => params[:srv_aliases],
        :webapps => params[:webapps],
        :primary_webapp => params[:primary_webapp],
        :restricted_ips => node[:apache][:restricted_ips],
        :holding_page => params[:holding_page],
        :docroot => params[:docroot]
      )
      only_if "test -d #{node[:apache][:dir]}/sites-available"
      notifies :reload, resources(:service => "apache2")
    end
    
    link "#{node[:apache][:dir]}/sites-enabled/#{hostname}.conf"  do
      to "#{node[:apache][:dir]}/sites-available/#{hostname}.conf"
    end
    
  end
  
  if params[:docroot].nil?
  
    remote_directory "/var/www/vhosts/#{hostname}" do
      source "docroot"
      owner node[:apache][:user]
      group node[:apache][:group]
      files_mode "0644"
      owner node[:apache][:user]
      group node[:apache][:group]
      mode "0755"
      recursive true
    end
    
    template "/var/www/vhosts/#{hostname}/holding.html" do
      source "holding.html.erb"
      mode 0644
      owner node[:apache][:user]
      group node[:apache][:group]
      variables(
          :holding_page_msg => params[:holding_page_msg]
      )
    end
  
  end

end