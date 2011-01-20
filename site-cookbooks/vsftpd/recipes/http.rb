#
# Cookbook Name:: vsftpd
# Recipe:: http
#
# Copyright 2011, Map of Medicine
#

include_recipe "apache2"

ftp_users = node[:vsftpd][:users]
ftp_base = node[:vsftpd][:ftp_base]
ftp_host = node[:vsftpd][:ftp_host]

template "#{node[:apache][:dir]}/sites-available/#{ftp_host}.conf" do
  source "vsftpd-vhost.conf.erb"
  mode 0644
  variables(
    :users => ftp_users.map{|k,v| k},
    :hostname => ftp_host,
    :ftp_base => ftp_base
  )
  notifies :reload, resources(:service => "apache2")
end

link "#{node[:apache][:dir]}/sites-enabled/#{ftp_host}.conf"  do
  to "#{node[:apache][:dir]}/sites-available/#{ftp_host}.conf"
end
