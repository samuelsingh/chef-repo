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
#  "server_ebs_volumes" => {
#    "volume_name" => {
#      "host" => "host_fqdn",
#      "device" => "device_name",
#      "mount" => "mount_point",
#      "fstype" => "fstype"
#    }
#  }
#}

volumes = node[:glusterfs][:server_ebs_volumes]

volumes.each do |name, conf|
  
  if node[:fqdn] == conf["host"]
  
    aws_ebs_volume "#{name}" do
      provider "aws_ebs_volume"
      aws_access_key node[:aws][:aws_access_key]
      aws_secret_access_key node[:aws][:aws_secret_access_key]
      volume_id name
      availability_zone node[:ec2][:placement_availability_zone]
      device conf.fetch("device")
      action :attach
      not_if "test -b #{conf["device"]}"
    end
    
    directory "#{conf["mount"]}" do
      owner "root"
      group "root"
      mode "0755"
      action :create
    end
  
    mount "#{conf["mount"]}" do
      device "#{conf["device"]}1"
      fstype "#{conf["fstype"]}"
    end
  
  end
  
end




