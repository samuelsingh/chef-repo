#
# Cookbook Name:: nexus 
# Recipe:: default
#
#
#

sonar_home = node[:sonar][:home]
nexus_home = node[:nexus][:home]

s_war_file = node[:sonar][:war]
n_war_file = node[:nexus][:war]
s_war_path = "#{sonar_home}/wars/#{s_war_file}"
n_war_path = "#{nexus_home}/wars/#{n_war_file}"

s_dbuser = node[:sonar][:dbuser]
s_dbpass = node[:sonar][:dbpass]
s_dbhost = node[:sonar][:dbhost]
s_dbname = node[:sonar][:dbname]

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

directory "#{sonar_home}" do
  mode "0755"
  action :create
  only_if "test -b /dev/sdh1"
end

directory "#{sonar_home}/mysql" do
  owner "mysql"
  group "mysql"
  mode "0755"
  action :create
  only_if "test -b /dev/sdh1"
end

directory "#{sonar_home}/wars" do
  mode "0755"
  action :create
  only_if "test -b /dev/sdh1"
end

# Deploy Nexus warfile
remote_file n_war_path do
  source n_war_file
  backup false
  mode "0644"
  not_if "test -f #{n_war_path}"
end

# Deploy Sonar warfile
remote_file s_war_path do
  source s_war_file
  backup false
  mode "0644"
  not_if "test -f #{s_war_path}"
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
    :war_path => n_war_path
  )
end

template "#{path9002}/conf/Catalina/localhost/sonar.xml" do
  source "sonar.xml.erb"
  mode 0755
  variables(
    :war_path => s_war_path,
    :dbuser => s_dbuser,
    :dbpass => s_dbpass,
    :dbhost => s_dbhost,
    :dbname => s_dbname
  )
end

directory "#{path9002}/webapps" do
  mode 0755
  owner run_usr
  group run_grp
  action :create
end