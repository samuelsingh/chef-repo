#
# Cookbook Name:: mms
# Recipe:: helper-scripts
#
# Copyright 2011, Map of Medicine
#

include_recipe "mms"
include_recipe "tomcat::rotate_logs"

bin = '/usr/local/bin'
sbin = '/usr/local/sbin'
lib = '/usr/local/lib'
content_store = '/var/shared/content'
loadq = content_store + '/load-queue'

contentpath = node[:mms][:contentpath]
rotate_dir = node[:tomcat][:log_rotate_dir]

# Installs dependent packages
["unzip","lsof"].each do |pkg|
  package pkg do
    action :install
  end
end

lsof_bin = value_for_platform(
  [ "ubuntu", "debian" ] => {
    "default" => "/usr/bin/lsof"
  },
  [ "redhat", "centos", "fedora" ] => {
    "default" => "/usr/sbin/lsof"
  },
  "default" => "/usr/bin/lsof"
)

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

template "#{sbin}/move-hg-packages.sh" do
  source "helper-scripts/move-hg-packages.sh.erb"
  mode 0755
  owner "sysadmin"
  group "sysadmin"
  variables(
    :bin => bin,
    :sbin => sbin,
    :contentpath => contentpath,
    :loadq => loadq
  )
end

template "#{sbin}/move-md-packages.sh" do
  source "helper-scripts/move-md-packages.sh.erb"
  mode 0755
  owner "sysadmin"
  group "sysadmin"
  variables(
    :bin => bin,
    :sbin => sbin,
    :contentpath => contentpath,
    :loadq => loadq,
    :content_store => content_store
  )
end

template "#{sbin}/mmsclean" do
  source "helper-scripts/mmsclean.erb"
  mode 0755
  owner "sysadmin"
  group "sysadmin"
end

template "#{sbin}/gather-mms-logs.rb" do
  source "helper-scripts/gather-mms-logs.rb.erb"
  mode 0755
  variables(
    :lib => lib,
    :log_dir => node[:mms][:logpath],
    :rotate_dir => rotate_dir,
    :lsof_bin => lsof_bin
  )
end