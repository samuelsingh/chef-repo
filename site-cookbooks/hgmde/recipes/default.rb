#
# Cookbook Name:: hgmde 
# Recipe:: default
#
#
#
#include_recipe "java"
#include_recipe "tomcat"

remote_file "/etc/init.d/tomcat9001" do
  source "tomcat9001"
  mode 0755
end

remote_file "/etc/init.d/tomcat9002" do
  source "tomcat9002"
  mode 0755
end

template "#{node[:hgmde][:hg_install_path]}/conf/server.xml" do
  source "server.xml.erb"
  mode 0755
end

template "#{node[:hgmde][:hg_install_path]}/conf/web.xml" do
  source "web.xml.erb"
  mode 0755
end

template "#{node[:hgmde][:hg_install_path]}/conf/tomcat-users.xml" do
  source "tomcat-users.xml.erb"
  mode 0755
end

template "#{node[:hgmde][:hg_install_path]}/conf/Catalina/localhost/choices.xml" do
  source "choices.xml.erb"
  mode 0755
end

template "#{node[:hgmde][:mde_install_path]}/conf/server.xml" do
  source "server.xml.erb"
  mode 0755
end

template "#{node[:hgmde][:mde_install_path]}/conf/web.xml" do
  source "web.xml.erb"
  mode 0755
end

template "#{node[:hgmde][:mde_install_path]}/conf/tomcat-users.xml" do
  source "tomcat-users.xml.erb"
  mode 0755
end

template "#{node[:hgmde][:mde_install_path]}/conf/Catalina/localhost/evidence.xml" do
  source "evidence.xml.erb"
  mode 0755
end

template "#{node[:apache][:dir]}/mods-enabled/proxy.conf" do
  source "proxy.conf.erb"
  mode 0755
end

 

