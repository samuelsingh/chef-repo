#
# Cookbook Name:: modx-revolution
# Recipe:: default
#
# Copyright 2011, Map of Medicine
#

include_recipe "apache2"

dbuser = node[:modx][:dbuser]
dbpass = node[:modx][:dbpass]
dbhost = node[:modx][:dbhost]
dbname = node[:modx][:dbname]

hostname = node[:modx][:hostname]
srv_aliases = node[:modx][:srv_aliases]
deployment_home = node[:modx][:deployment_home]
apache_usr = node[:apache][:user]

modx_pkg = "modx-2.0.6-pl2.zip"
modx_dir = modx_pkg.gsub('.zip', '')
modx_path = "/usr/local/" + modx_dir

# Installs modx dependencies
["php5-common","php5","libapache2-mod-php5","php5-mysql","php5-curl","unzip"].each do |pkg|
  package pkg do
    action :install
  end
end

# Grab Modx package
remote_file "/tmp/#{modx_pkg}" do
  source "#{modx_pkg}"
  backup false
  mode "0644"
  not_if "test -f /tmp/#{modx_pkg}"
end

# Deploy Modx application
execute "deploy_modx" do
  command "unzip /tmp/#{modx_pkg} -d /usr/local && chown -R #{apache_usr} /usr/local/#{modx_dir}"
  not_if "test -f #{modx_path}/index.php"
end

# Remove setup directory
directory "#{modx_path}/setup" do
  recursive true
  action :delete
end

# Relocated to shared store
# TODO: make this configurable on/off, so that the recipe can be used by chef-solo
directory "#{modx_path}/assets" do
  recursive true
  action :delete
  not_if "test -L #{modx_path}/assets"
end

directory "#{modx_path}/core/components" do
  recursive true
  action :delete
  not_if "test -L #{modx_path}/core/components"
end

# Link shared resources
link "#{modx_path}/global"  do
  to "#{deployment_home}/global"
end

link "#{modx_path}/assets"  do
  to "#{deployment_home}/shared/assets"
end

link "#{modx_path}/core/components"  do
  to "#{deployment_home}/core/components"
end

# Update php.ini file
remote_file "/etc/php5/apache2/php.ini" do
  source "php.ini"
  mode "0644"
  notifies :restart, resources("service[apache2]"), :delayed
end

# Put modx configuration file in place
template "#{modx_path}/core/config/config.inc.php" do
  source "config.inc.php.erb"
  mode 0644
  owner apache_usr
  variables(
    :dbuser => dbuser,
    :dbpass => dbpass,
    :dbhost => dbhost,
    :dbname => dbname,
    :modx_path => modx_path
  )
end

# Add the apache configuration
template "#{node[:apache][:dir]}/sites-available/#{hostname}.conf" do
  source "modx-vhost.conf.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :hostname => hostname,
    :srv_aliases => srv_aliases,
    :restricted_ips => node[:apache][:restricted_ips],
    :modx_path => modx_path
  )
  notifies :reload, resources(:service => "apache2"), :delayed
  only_if "test -d #{node[:apache][:dir]}/sites-available"
end

link "#{node[:apache][:dir]}/sites-enabled/#{hostname}.conf"  do
  to "#{node[:apache][:dir]}/sites-available/#{hostname}.conf"
end
