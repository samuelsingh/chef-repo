#
# Cookbook Name:: foxdev_mounts
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

# Transition to glusterfs
unless recipe?("glusterfs::client")
  
# Nasty hack, needs improving
unless node[:hostname] == "filer"

  package "portmap" do
    action :install
  end
  
  package "nfs-common" do
    action :install
  end
  
  node[:nfs_mounts].each do |name,params|
  
    if defined?(params.fetch("clientdir")) && defined?(params.fetch("host")) && defined?(params.fetch("hostdir"))
  
      directory "#{params.fetch("clientdir")}" do
        owner "root"
        group "root"
        mode "0755"
        action :create
        not_if "test -d #{params.fetch("clientdir")}"
      end
  
      mount "#{params.fetch("clientdir")}" do
        device "#{params.fetch("host")}:#{params.fetch("hostdir")}"
        fstype "nfs"
        options "tcp,rsize=32768,wsize=32768,rw"
        action [:mount, :enable]
      end
  
    end
  
  end
  
end

end
