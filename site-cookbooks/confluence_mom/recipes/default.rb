#
# Cookbook Name:: Confluence 
# Recipe:: default
#
# Manual Steps!
#
# MySQL:
#
#   create database confluence character set utf8;
#   grant all privileges on confluence.* to 'confluence'@'localhost' identified by '$confluence_password';
#   flush privileges;
include_recipe "java"
include_recipe "tomcat"

remote_file "/etc/init.d/tomcat9001" do
  source "tomcat9001"
  mode 0755
end

template "#{node[:confluence][:install_path]}/conf/server.xml" do
  source "server.xml.erb"
  mode 0755
end

template "#{node[:confluence][:install_path]}/conf/web.xml" do
  source "web.xml.erb"
  mode 0755
end

template "#{node[:confluence][:install_path]}/conf/tomcat-users.xml" do
  source "tomcat-users.xml.erb"
  mode 0755
end

template "#{node[:confluence][:install_path]}/conf/Catalina/localhost/confluence.xml" do
  source "confluence.xml.erb"
  mode 0755
end

template "#{node[:confluence][:install_path]}/conf/Catalina/localhost/manager-confluence.xml" do
  source "manager-confluence.xml.erb"
  mode 0755
end
