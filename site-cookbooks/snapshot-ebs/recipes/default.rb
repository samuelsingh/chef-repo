#
# Cookbook Name:: snapshot_ebs
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

package "php5" do 
  action :install 
  options "--allow-unauthenticated"
end

directory "/root/.ec2" do 
  owner "root"
  group "root"
  mode "700"
  action :create
  not_if "test -d /root/.ec2"
end 

node[:snapshot_ebs][:volumes].each do |ebs_volume|
  volume_id = ebs_volume[:volume_id]
  volume_name = ebs_volume[:name]
  retention = ebs_voume[:retention]
  
  template "/etc/cron.daily/ebs_snapshot_#{volume_name}" do
    source "snapshot_ebs_cron.erb"
    mode 0755
    variables(
	:volume_id => volume_id,
	:retention => retention
    )
  end 

end

remote_file "#{node[:snapshot_ebs][:install_path]}/snapshot_ebs.sh" do
  source "snapshot_ebs.sh"
  mode 0755
end

remote_file "#{node[:snapshot_ebs][:install_path]}/remove_old_snapshots.php" do
  source "remove_old_snapshots.php"
  mode 0755
end

remote_file "/root/.ec2/cert-OTTZ2OZ3UKDVMK7335FOBQ6W2VAVBOI5.pem" do
  source "cert-OTTZ2OZ3UKDVMK7335FOBQ6W2VAVBOI5.pem"
  mode 0700
end

remote_file "/root/.ec2/pk-OTTZ2OZ3UKDVMK7335FOBQ6W2VAVBOI5.pem" do
  source "pk-OTTZ2OZ3UKDVMK7335FOBQ6W2VAVBOI5.pem"
  mode 0700
end

