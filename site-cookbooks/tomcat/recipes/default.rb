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

execute "rsync_standard_appserver_usr"  do
  command "rsync -rlpv --exclude '.svn/' #{node[:mom_scripts][:global_inf_base]}/standard/#{node[:tomcat][:role]}/usr/ /usr"
  action :run
  only_if "test -d #{node[:mom_scripts][:global_inf_base]}/standard/#{node[:tomcat][:role]}/usr"
end

# ln -s /usr/local/<tomcat version> /usr/local/tomcat
link "/usr/local/tomcat" do
  to "/usr/local/#{node[:tomcat][:version]}"
end

group "tomcat"  do
  gid 10008
end

user "tomcat"  do
  comment "Tomcat"
  uid "10008"
  gid "tomcat"
  home "/home/tomcat"
  shell "/bin/bash"
  not_if "[ ! -z \"`who | grep tomcat`\" ]"
end

node[:tomcat][:ajp_ports].each do |ajp_port|
  
  # Calculates the values for port configurations
  shutdown_port = ajp_port-1000
  http_port = shutdown_port+79
  jmx_port = http_port+6
  
  directory "#{node[:tomcat][:basedir]}/server#{ajp_port}"  do
    owner "sysadmin"
    group "sysadmin"
    mode "0755"
    recursive true
    action :create
    not_if "test -d #{node[:tomcat][:basedir]}/server#{ajp_port}"
  end
  
  directory "#{node[:tomcat][:basedir]}/server#{ajp_port}/work"  do
    owner "tomcat"
    group "tomcat"
    mode "0755"
    action :create
    not_if "test -d #{node[:tomcat][:basedir]}/server#{ajp_port}/work"
  end
  
  directory "#{node[:tomcat][:basedir]}/server#{ajp_port}/temp"  do
    owner "tomcat"
    group "tomcat"
    mode "0755"
    action :create
    not_if "test -d #{node[:tomcat][:basedir]}/server#{ajp_port}/temp"
  end
  
  directory "#{node[:tomcat][:basedir]}/server#{ajp_port}/logs"  do
    owner "tomcat"
    group "tomcat"
    mode "0755"
    action :create
    not_if "test -d #{node[:tomcat][:basedir]}/server#{ajp_port}/logs"
  end
  
  directory "#{node[:tomcat][:basedir]}/server#{ajp_port}/etc"  do
    owner "tomcat"
    group "tomcat"
    mode "0755"
    action :create
    not_if "test -d #{node[:tomcat][:basedir]}/server#{ajp_port}/etc"
  end
  
  remote_directory "#{node[:tomcat][:basedir]}/server#{ajp_port}/conf" do
    source "conf"
    files_owner "tomcat"
    files_group "tomcat"
    files_mode "0644"
    owner "tomcat"
    group "tomcat"
    mode "0755"
  end
  
  template "#{node[:tomcat][:basedir]}/server#{ajp_port}/conf/server.xml" do
    source "server.xml.erb"
    mode 0644
    owner "tomcat"
    group "tomcat"
    variables(
      :ajp_port => ajp_port,
      :shutdown_port => shutdown_port,
      :http_port => http_port
    )
  end
  
  template "#{node[:tomcat][:basedir]}/server#{ajp_port}/conf/Catalina/localhost/manager.xml" do
    source "manager.xml.erb"
    mode 0644
    owner "tomcat"
    group "tomcat"
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
      :jmx_port => jmx_port
    )
  end

    
  service "tomcat#{ajp_port}"  do
    supports :status => true, :restart => true, :reload => true
    action [ :enable ]
  end
  
end
