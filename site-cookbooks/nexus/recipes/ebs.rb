#
# Cookbook Name:: nexus
# Recipe:: ebs
#
# Copyright 2010, Map of Medicine
#

include_recipe "aws"

name = node[:nexus][:ebs][:name]
device = node[:nexus][:ebs][:device]
blk = device[/\/dev\/\D+/]
fstype = node[:nexus][:ebs][:fstype]
home = node[:nexus][:home]

tomcat_user = node[:tomcat][:user]
tomcat_group = node[:tomcat][:group]
  
aws_ebs_volume "#{name}" do
  provider "aws_ebs_volume"
  aws_access_key node[:aws][:aws_access_key]
  aws_secret_access_key node[:aws][:aws_secret_access_key]
  volume_id name
  availability_zone node[:ec2][:placement_availability_zone]
  device blk
  action :attach
  not_if "test -b #{device}"
end

directory home do
  owner tomcat_user
  group tomcat_group
  mode "0755"
  action :create
  not_if "test -d #{home}"
end

mount home do
  device device
  fstype fstype
end




