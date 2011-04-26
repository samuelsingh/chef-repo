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

# Symlink tests are included here for backwards compatibility.

directories = ["#{modx_path}/global","#{modx_path}/assets","#{modx_path}/core/components","#{modx_path}/core/cache"]

directories.each do |dir|
  
  directory dir do
    action :create
    not_if "test -L #{dir}"
  end

end

mount "#{modx_path}/global" do
  device "#{deployment_home}/global"
  fstype "none"
  options "bind,rw"
  action :mount
  not_if "test -L #{modx_path}/global"
end

mount "#{modx_path}/assets" do
  device "#{deployment_home}/shared/assets"
  fstype "none"
  options "bind,rw"
  action :mount
  not_if "test -L #{modx_path}/assets"
end

mount "#{modx_path}/core/components" do
  device "#{deployment_home}/shared/components"
  fstype "none"
  options "bind,rw"
  action :mount
  not_if "test -L #{modx_path}/core/components"
end

mount "#{modx_path}/core/cache" do
  device "#{deployment_home}/shared/cache"
  fstype "none"
  options "bind,rw"
  action :mount
  not_if "test -L #{modx_path}/core/cache"
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
