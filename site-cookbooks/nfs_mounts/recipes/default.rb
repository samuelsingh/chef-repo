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

node[:nfs_mounts].each do |mountpoint|

  directory "#{mountpoint[:clientdir]}" do
    owner "root"
    group "root"
    mode "0755"
    action :create
    not_if "test -d #{mountpoint[:clientdir]}"
  end

  mount "#{mountpoint[:clientdir]}" do
    device "#{mountpoint[:host]}:#{mountpoint[:hostdir]}"
    fstype "nfs"
    options "tcp,rsize=32768,wsize=32768,rw"
    action [:mount, :enable]
  end

end
