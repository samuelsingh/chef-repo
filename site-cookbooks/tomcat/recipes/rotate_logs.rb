#
# Cookbook Name:: tomcat
# Recipe:: helper-scripts
#
# Copyright 2011, Map of Medicine
#

bin = '/usr/local/bin'
sbin = '/usr/local/sbin'

tomcat_srv = node[:tomcat][:srv_dir]
rotate_base = node[:tomcat][:log_rotate_dir]
tomcat_ports = node[:tomcat][:ajp_ports]


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

template "#{sbin}/gather-tomcat-logs.rb" do
  source "gather-tomcat-logs.rb.erb"
  mode 0755
  variables(
    :bin => bin,
    :tomcat_srv => tomcat_srv,
    :rotate_base => rotate_base,
    :lsof_bin => lsof_bin
  )
end

#cron "rotate-httpd-logs" do
#  hour node[:tomcat][:rotate_hour]
#  minute node[:tomcat][:rotate_min]
#  command "#{sbin}/gather-tomcat-logs.rb"
#end