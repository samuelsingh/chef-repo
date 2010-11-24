#
# Cookbook Name:: hgmde 
# Recipe:: default
#
#
#

hg_shared = node[:hg_mde][:hg_shared]
mde_shared = node[:hg_mde][:mde_shared]

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

link "#{path9001}/webapps/choices" do
  to "#{hg_shared}/healthguides-#{hg_version}/webapps/choices"
  only_if "test -d #{hg_shared}/healthguides-#{hg_version}/webapps"
end

link "#{path9002}/webapps/evidence" do
  to "#{mde_shared}/mde-#{mde_version}/webapps/evidence"
  only_if "test -d #{mde_shared}/mde-#{mde_version}/webapps"
end
