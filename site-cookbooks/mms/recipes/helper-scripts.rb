#
# Cookbook Name:: mms
# Recipe:: helper-scripts
#
# Copyright 2011, Map of Medicine
#

bin = '/usr/local/bin'
sbin = '/usr/local/sbin'

contentpath = node[:mms][:contentpath]


version    = node[:mms][:version]
deploy_dir = node[:mms][:deploy_dir]
mmpath     = node[:mms][:mapmanager][:path]
logpath    = node[:mms][:logpath]

# Installs dependent packages
["unzip"].each do |pkg|
  package pkg do
    action :install
  end
end

template "#{sbin}/clean_package_names.sh" do
  source "helper-scripts/clean_package_names.sh.erb"
  mode 0755
  owner "sysadmin"
  group "sysadmin"
  variables(
    :bin => bin,
    :sbin => sbin,
    :contentpath => contentpath
  )
end

template "#{sbin}/clean_package_names.sh" do
  source "helper-scripts/clean_package_names.sh.erb"
  mode 0755
  owner "sysadmin"
  group "sysadmin"
  variables(
    :bin => bin,
    :sbin => sbin,
    :contentpath => contentpath
  )
end

template "#{bin}/remove_spaces.sh" do
  source "helper-scripts/remove_spaces.sh.erb"
  mode 0755
  owner "sysadmin"
  group "sysadmin"
  variables(
    :bin => bin,
    :sbin => sbin,
    :contentpath => contentpath
  )
end




################################

directory "#{cstools}/config"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{cstools}/config"
end

remote_file "#{cstools}/cs-tools" do
  source "cs-tools/cs-tools.sh"
  mode "0755"
end

directory "#{logpath}/cs-tools"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{logpath}/cs-tools"
end

# cs-tools doesn't actually use values from this
#
template "#{cstools}/config/mom.properties" do
  source "mom/mom.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mompath => "/tmp",
    :fqdn => "unset"
  )
end

template "#{cstools}/config/m2mr2-cs-deployment.properties" do
  source "cs-tools/m2mr2-cs-deployment.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
end

template "#{cstools}/config/repository.properties" do
  source "cs-tools/repository.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mmpath => mmpath
  )
end

link "#{cstools}/config/m2mr2-cs-base.properties"  do
  to "#{node[:mms][:mapmanager][:path]}/config/m2mr2-cs-base.properties"
  only_if "test -f #{node[:mms][:mapmanager][:path]}/config/m2mr2-cs-base.properties"
end

remote_file "#{cstools}/config/auto-approve.properties" do
  source "cs-tools/config/auto-approve.properties"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
end

template "#{cstools}/config/log4j.xml" do
  source "cs-tools/log4j.xml.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :logpath => logpath
  )
end

template "/etc/profile.d/mms-cstools.sh" do
  source "etc/profile.d/mms-cstools.sh.erb"
  mode 0755
  owner "root"
  group "root"
  variables(
    :cstools_path => cstools
  )
end

remote_file "#{cstools}/config/m2mr2-cs-spring.properties" do
  source "cs-tools/config/m2mr2-cs-spring.properties"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
end

link "#{cstools}/lib"  do
  to "#{deploy_dir}/mms-#{version}/cs-tools/lib"
  only_if "test -d #{deploy_dir}/mms-#{version}/cs-tools"
end

link "#{cstools}/archive"  do
  to "#{deploy_dir}/mms-#{version}/cs-tools/archive"
  only_if "test -d #{deploy_dir}/mms-#{version}/cs-tools"
end