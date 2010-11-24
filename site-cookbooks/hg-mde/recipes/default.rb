#
# Cookbook Name:: hgmde 
# Recipe:: default
#
#
#

path9001 = "/var/tomcat/server9001"
path9002 = "/var/tomcat/server9002"

log node[:tomcat][:ajp_ports]

template "#{path9001}/etc/java_opts.conf" do
  source "java_opts.conf.erb"
  mode 0755
  owner "root"
  group "root"
  only_if "test -d #{path9001}/etc"
end

template "#{path9002}/etc/java_opts.conf" do
  source "java_opts.conf.erb"
  mode 0755
  owner "root"
  group "root"
  only_if "test -d #{path9002}/etc"
end

template "#{path9001}/conf/Catalina/localhost/choices.xml" do
  source "choices.xml.erb"
  mode 0755
  only_if "test -d #{path9001}/conf"
end

template "#{path9002}/conf/Catalina/localhost/evidence.xml" do
  source "evidence.xml.erb"
  mode 0755
  only_if "test -d #{path9002}/conf"
end

directory "#{path9001}/webapps" do
  mode 0755
  owner "tomcat"
  group "tomcat"
  action :create
end

directory "#{path9002}/webapps" do
  mode 0755
  owner "tomcat"
  group "tomcat"
  action :create
end
