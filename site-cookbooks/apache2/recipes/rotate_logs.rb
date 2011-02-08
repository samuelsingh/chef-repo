#
# Cookbook Name:: apache2
# Recipe:: helper-scripts
#
# Copyright 2011, Map of Medicine
#

bin = '/usr/local/bin'
sbin = '/usr/local/sbin'

backup_base = node[:apache][:log_bak_dir]
rotate_base = node[:apache][:log_rotate_dir]

# Installs dependent packages
["lsof","logrotate"].each do |pkg|
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

rotate_command = value_for_platform(
  [ "ubuntu", "debian" ] => {
    "default" => "/usr/sbin/logrotate /etc/logrotate.d/apache2 -f"
  },
  [ "redhat", "centos", "fedora" ] => {
    "default" => "/usr/sbin/logrotate /etc/logrotate.conf -f"
  },
  "default" => "/usr/sbin/logrotate /etc/logrotate.d/apache2 -f"
)


template "#{sbin}/gather-httpd-logs" do
  source "gather-httpd-logs.erb"
  mode 0755
  variables(
    :bin => bin,
    :backup_base => backup_base,
    :rotate_base => rotate_base,
    :lsof_bin => lsof_bin,
    :rotate_command => rotate_command
  )
end

remote_file "#{bin}/weblogdate.pl" do
  source "weblogdate.pl"
  mode 0755
end

cron "rotate-httpd-logs" do
  hour node[:apache][:rotate_hour]
  minute node[:apache][:rotate_hour]
  command "#{sbin}/gather-httpd-logs"
end