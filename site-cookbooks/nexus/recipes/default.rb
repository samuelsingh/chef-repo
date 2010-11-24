#
# Cookbook Name:: nexus 
# Recipe:: default
#
#
#

war_file = node[:nexus][:war]
nexus_home = node[:nexus][:home]
war_path = "#{nexus_home}/wars/#{war_file}"
run_usr = node[:tomcat][:user]
run_grp = node[:tomcat][:group]

path9002 = "/var/tomcat/server9002"

directory "#{nexus_home}" do
  mode 0755
  owner run_usr
  group run_grp
  recursive true
end

directory "#{nexus_home}/wars" do
  mode 0755
  owner run_usr
  group run_grp
  recursive true
end

# Deploy Nexus warfile
remote_file war_path do
  source war_file
  backup false
  mode "0644"
  not_if "test -f #{war_path}"
end

template "#{path9002}/etc/java_opts.conf" do
  source "java_opts.conf.erb"
  mode 0755
  owner "root"
  group "root"
  variables(
    :nexus_home => nexus_home
  )
end

template "#{path9002}/conf/Catalina/localhost/nexus.xml" do
  source "nexus.xml.erb"
  mode 0755
  variables(
    :war_path => war_path
  )
end

directory "#{path9002}/webapps" do
  mode 0755
  owner run_usr
  group run_grp
  action :create
end