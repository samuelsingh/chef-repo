#
# Cookbook Name:: glusterfs
# Recipe:: client
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

#"glusterfs" => {
#  "server_eph_volumes" => {
#    "volume_name" => {
#      "device" => "device_name",
#      "fstype" => "fstype"
#    }
#  }
#}

volumes = node[:glusterfs][:server_eph_volumes]

volumes.each do |name, conf|
  
  directory "/gfs/#{name}" do
    owner "root"
    group "root"
    mode "0755"
    action :create
  end
  
  mount "/gfs/#{name}" do
    device "#{conf.fetch("device")}"
    fstype "#{conf.fetch("fstype")}"
  end
  
end




