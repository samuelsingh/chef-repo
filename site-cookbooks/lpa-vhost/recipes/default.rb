#
# Cookbook Name:: lpa-vhost
# Recipe:: default
#
# Copyright 2010, Map of Medicine
#


include_recipe "apache2"

node[:lpa_vhost].each do |hostname,params|

  if defined?(node[:apache][:dir])

    params["static_offload"].nil? ? static_offload = true : static_offload = params["static_offload"]
    params["mom_port"].nil? ? mom_port = "9001" : mom_port = params["mom_port"]
    params["aa_port"].nil? ? aa_port = "9002" : aa_port = params["aa_port"]
    
    template "#{node[:apache][:dir]}/sites-available/#{hostname}.conf" do
      source "lpa-vhost.conf.erb"
      mode 0644
      owner node[:apache][:user]
      group node[:apache][:group]
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
    source "lpa"
    files_owner node[:apache][:user]
    files_group node[:apache][:group]
    files_mode "0644"
    owner node[:apache][:user]
    group node[:apache][:group]
    mode "0755"
    recursive true
    not_if "test -d /var/www/vhosts/#{hostname}"
  end
  
  # template "/var/www/vhosts/#{hostname}/holding.html" do
  #   source "holding.html.erb"
  #   mode 0644
  #   owner node[:apache][:user]
  #   group node[:apache][:group]
  #   variables(
  #       :holding_page_msg => params["holding_page_msg"]
  #   )
  # end

end
