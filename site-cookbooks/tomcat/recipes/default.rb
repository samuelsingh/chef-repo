#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2010, Map of Medicine
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

t_user = node[:tomcat][:user]
t_group = node[:tomcat][:group]
t_home = node[:tomcat][:user_home]

group "#{t_group}"  do
  gid 10008
end

user "#{t_user}"  do
  comment "Tomcat"
  uid "10008"
  gid t_group
  home t_home
  shell "/bin/bash"
  not_if "[ ! -z \"`who | grep #{t_user}`\" ]"
end

template "/etc/pam.d/su" do
  source "etc-pamd-su.erb"
  mode 0644
end

template "/etc/security/limits.d/tomcat.conf" do
  source "etc-security-limitsd-tomcat.conf.erb"
  mode 0644
  variables(
    :t_user => t_user
  )
end

# Deploy Tomcat application
execute "deploy_tomcat" do
  command "cd /usr/local && tar xzf /var/tmp/#{node[:tomcat][:version]}.tar.gz"
  action :nothing
end

# Grab Tomcat package
remote_file "/var/tmp/#{node[:tomcat][:version]}.tar.gz" do
  source "#{node[:tomcat][:version]}.tar.gz"
  backup false
  mode "0644"
  notifies :run, resources(:execute => "deploy_tomcat"), :immediately
  not_if "test -f /usr/local/#{node[:tomcat][:version]}/RUNNING.txt"
end

# Delete tmp Tomcat package if it's been deployed
file "/var/tmp/#{node[:tomcat][:version]}.tar.gz" do
  action :delete
  only_if "test -f /usr/local/#{node[:tomcat][:version]}/RUNNING.txt"
end

# ln -s /usr/local/<tomcat version> /usr/local/tomcat
link "/usr/local/tomcat" do
  to "/usr/local/#{node[:tomcat][:version]}"
end

node[:tomcat][:ajp_ports].each do |ajp_port|
  
  # Calculates the values for port configurations
  shutdown_port = ajp_port-1000
  http_port = shutdown_port+79
  jmx_port = http_port+6
  
  directory "#{node[:tomcat][:basedir]}/server#{ajp_port}"  do
    owner t_user
    group t_group
    mode "0755"
    recursive true
    action :create
    not_if "test -d #{node[:tomcat][:basedir]}/server#{ajp_port}"
  end
  
  directory "#{node[:tomcat][:basedir]}/server#{ajp_port}/work"  do
    owner t_user
    group t_group
    mode "0755"
    action :create
    not_if "test -d #{node[:tomcat][:basedir]}/server#{ajp_port}/work"
  end
  
  directory "#{node[:tomcat][:basedir]}/server#{ajp_port}/temp"  do
    owner t_user
    group t_group
    mode "0755"
    action :create
    not_if "test -d #{node[:tomcat][:basedir]}/server#{ajp_port}/temp"
  end
  
  directory "#{node[:tomcat][:basedir]}/server#{ajp_port}/logs"  do
    owner t_user
    group t_group
    mode "0755"
    action :create
    not_if "test -d #{node[:tomcat][:basedir]}/server#{ajp_port}/logs"
  end
  
  directory "#{node[:tomcat][:basedir]}/server#{ajp_port}/etc"  do
    owner t_user
    group t_group
    mode "0755"
    action :create
    not_if "test -d #{node[:tomcat][:basedir]}/server#{ajp_port}/etc"
  end
  
  directory "#{node[:tomcat][:basedir]}/server#{ajp_port}/shared/lib"  do
    owner t_user
    group t_group
    mode "0755"
    recursive true
    action :create
    not_if "test -d #{node[:tomcat][:basedir]}/server#{ajp_port}/shared/lib"
  end
  
  directory "#{node[:tomcat][:basedir]}/server#{ajp_port}/common/classes"  do
    owner t_user
    group t_group
    mode "0755"
    recursive true
    action :create
    only_if "test -d #{node[:tomcat][:basedir]}/server#{ajp_port}"
  end
  
  directory "#{node[:tomcat][:basedir]}/server#{ajp_port}/common/lib"  do
    owner t_user
    group t_group
    mode "0755"
    recursive true
    action :create
    only_if "test -d #{node[:tomcat][:basedir]}/server#{ajp_port}"
  end
  
  remote_directory "#{node[:tomcat][:basedir]}/server#{ajp_port}/conf" do
    source "conf"
    owner t_user
    group t_group
    files_mode "0644"
    owner t_user
    group t_group
    mode "0755"
  end
  
  template "#{node[:tomcat][:basedir]}/server#{ajp_port}/conf/server.xml" do
    source "server.xml.erb"
    mode 0644
    owner t_user
    group t_group
    variables(
      :ajp_port => ajp_port,
      :shutdown_port => shutdown_port,
      :http_port => http_port
    )
  end
  
  template "#{node[:tomcat][:basedir]}/server#{ajp_port}/conf/Catalina/localhost/manager.xml" do
    source "manager.xml.erb"
    mode 0644
    owner t_user
    group t_group
    variables(
      :ajp_port => ajp_port
    )
  end

  template "/etc/init.d/tomcat#{ajp_port}" do
    source "tomcat.TEMPLATE.erb"
    mode 0755
    owner "root"
    group "root"
    variables(
      :ajp_port => ajp_port,
      :jmx_port => jmx_port,
      :t_user => t_user,
      :t_group => t_group
    )
  end

    
  service "tomcat#{ajp_port}"  do
    supports :status => true, :restart => true, :reload => true
    action [ :enable ]
  end
  
end
