#
# Manage the mounting of the svn repo partition, and maybe stuff that's on it
#

directory "/var/svn"  do
  mode "0755"
  recursive true
  action :create
  not_if "test -d /var/svn"
  owner "root"
  group "root"
end

mount "/var/svn" do
  device "/dev/sdh1"
  fstype "ext3"
  action [:mount, :enable]
  only_if "test -b /dev/sdh1"
end

