#
# Cookbook Name:: nexus 
# Recipe:: default
#
#
#

warfile = node[:nexus][:war]
nexus_home = node[:nexus][:home]

path9002 = "/var/tomcat/server9002"

# Grab Quova data files, if they're not already in place
remote_file "#{nexus_home}/wars/#{warfile}" do
  source "#{warfile}"
  backup false
  mode "0644"
  not_if "test -f #{nexus_home}/wars/#{warfile}"
end

template "#{path9002}/etc/java_opts.conf" do
  source "java_opts.conf.erb"
  mode 0755
  owner "root"
  group "root"
end

template "#{path9002}/conf/Catalina/localhost/nexus.xml" do
  source "nexus.xml.erb"
  mode 0755
end