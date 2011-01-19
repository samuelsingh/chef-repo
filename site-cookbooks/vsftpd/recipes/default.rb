#
# Cookbook Name:: vsftpd
# Recipe:: default
#
# Copyright 2011, Map of Medicine
#

ftp_users = node[:vsftpd][:users]
ftp_base = node[:vsftpd][:ftp_base]
ftp_host = node[:vsftpd][:ftp_host]

["libshadow-ruby1.8", "vsftpd"].each do |pkg|
  package pkg do
    action :install
  end
end

service "vsftpd" do
  case node[:platform]
  when "debian","ubuntu"
    service_name "vsftpd"
  end
  supports value_for_platform(
    "default" => { "default" => [:restart, :reload ] }
  )
  action :enable
end

directory ftp_base do
  action :create
end

template "/etc/vsftpd.conf" do
  source "vsftpd.conf.erb"
  mode 0644
  variables(
    :ftp_host => ftp_host
  )
  notifies :restart, resources(:service => "vsftpd")
end

template "/etc/vsftpd.user_list" do
  source "vsftpd.user_list.erb"
  mode 0644
  variables(
    :users => ftp_users.map{|k,v| k}
  )
end

ftp_users.each do |user,values|
  
  user "#{user}"  do
    comment "FTP user"
    uid values[:uid]
    home ftp_base + '/' + user
    shell "/bin/sh"
    supports :manage_home => true
    password values[:pwd_hash]
    not_if "[ ! -z \"`who | grep #{user}`\" ]"
  end
  
end
