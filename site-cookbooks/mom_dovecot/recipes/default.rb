#
# Cookbook Name:: mom_dovecot
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

#Recipe to install dovecot pop3 server to post messages at Jira 

package "dovecot-pop3d" do
   action :install 
   options "--allow-unauthenticated"
end

service "dovecot" do 
 supports :restart => true
 action [:enable, :start]
end

remote_file "/etc/dovecot/dovecot.conf" do
   source "dovecot.conf"
   mode 0644
   owner "root"
   group "root" 
   notifies :restart, "service[dovecot]"
end

directory "/var/mail" do 
  owner "root"
  group "root"
  mode "2777" 
end

user "desktop-support" do 
  uid "10023"
  shell "/bin/bash"
  home "/home/desktop-support"
  supports :manage_home => true
  password "$6$a6BU8mv3$.Y.K/Dzsi.wdLOBxdSriTI6twJ/iKX.DbFZW9ABXRlYx1xbv6buuER.NUath2n2fs59iYfl3wpjuRk8el.dUP0"
  not_if "[ ! -z \"`who | grep desktop-support`\" ]"
end

user "sdk-support" do
  uid "10022"
  shell "/bin/bash"
  home "/home/sdk-support"
  supports :manage_home => true
  password "$6$TxxebpuN$y6m2li1F1xpr4iygtFa8CVYfMdWBuha13ZREW44RyD7rLYfDgsiTbQRV2c3syAB.kcuagjDK8qKlys.cYcGX51"
  not_if "[ ! -z \"`who | grep sdk-support`\" ]"
end

user "tracking" do
  uid "10024"
  shell "/bin/bash"
  home "/home/tracking"
  supports :manage_home => true
  password "$6$Jwfu4j9I$eFZqoZMlAfu1Uqb/d781LvfsQ1fpvg.aD1E9Amrg1Yaj3PBbrp4zpH4UWxI644.kUfwtroDG1SpiLiO9yXhqi0"
  not_if "[ ! -z \"`who | grep tracking`\" ]"
end

# See OPS-33344 for details of this user
user "productivity" do
  uid "10025"
  shell "/bin/bash"
  home "/home/productivity"
  supports :manage_home => true
  password "$6$/MJN3wH6$g9/J0jEAeTvlmMqhXDN0WkkKvFC1leBlcfdRoIT6h8y11qt0mE/edMAx22pqls9.JL3lhtbuG0AXbABrTfgJd1"
end
