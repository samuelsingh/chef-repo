#
# Cookbook Name:: hg-mde 
# Recipe:: content_source
#
# This recipe should be installed on the node hosting the
# relevant MD content packages

group 'syncuser' do
  action :create
end

user 'syncuser' do
  username 'syncuser'
  comment 'syncuser'
  gid 'syncuser'
  home '/home/syncuser'
  supports :manage_home => true
end

directory '/home/syncuser' do
  owner 'syncuser'
  group 'syncuser'
  action :create
end

remote_file '/home/syncuser/.ssh/authorized_keys' do
  source 'authorized_keys'
  owner 'syncuser'
  group 'syncuser'
  mode '0600'
end
