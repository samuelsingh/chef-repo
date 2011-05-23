#
# Cookbook Name:: map-display-3
# Recipe:: rotate_logs
#
# Copyright 2011, Map of Medicine
#

bin = '/usr/local/bin'
sbin = '/usr/local/sbin'
lib = '/usr/local/lib'

log_dir = "#{node[:map_display][:application][:mtmpath]}/logs"
rotate_base = node[:tomcat][:log_rotate_dir]

# Installs dependent packages
["lsof"].each do |pkg|
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

template "#{sbin}/gather-md-logs.rb" do
  source "rotate_logs/gather-md-logs.rb.erb"
  mode 0755
  variables(
    :lib => lib,
    :log_dir => log_dir,
    :rotate_dir => rotate_dir,
    :lsof_bin => lsof_bin
  )
end

cron "rotate-md-logs" do
  hour "#{node[:tomcat][:rotate_hour].to_i + 1}"
  minute node[:tomcat][:rotate_min]
  command "#{sbin}/gather-md-logs.rb"
end
