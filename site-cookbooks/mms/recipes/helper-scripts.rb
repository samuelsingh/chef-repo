#
# Cookbook Name:: mms
# Recipe:: helper-scripts
#
# Copyright 2011, Map of Medicine
#

bin = '/usr/local/bin'
sbin = '/usr/local/sbin'
content_store = '/var/shared/content'
loadq = content_store + '/load-queue'

contentpath = node[:mms][:contentpath]

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