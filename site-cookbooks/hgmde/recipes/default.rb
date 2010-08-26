#
# Cookbook Name:: hgmde 
# Recipe:: default
#
#
#
#include_recipe "java"
#include_recipe "tomcat"

template "/etc/init.d/tomcat9001" do
  source "tomcat.TEMPLATE.erb"
  mode 0755
  owner "root"
  group "root"
  variables(
    :ajp_port => "9001",
    :jmx_port => "8086"
  )
end

template "/etc/init.d/tomcat9002" do
  source "tomcat.TEMPLATE.erb"
  mode 0755
  owner "root"
  group "root"
  variables(
    :ajp_port => "9002",
    :jmx_port => "8087"
  )
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
  source "mde_server.xml.erb"
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

 

