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

directory "/var/svn/BACKUPS"  do
  mode "0755"
  recursive true
  action :create
  not_if "test -d /var/svn/BACKUPS"
  owner "root"
  group "root"
end

remote_file "/usr/local/sbin/svn_backup.sh" do
  source "svn_dump.sh"
  mode 0755
end

cron "svn_backup" do
  hour "20"
  minute "30"
  command "/usr/local/sbin/svn_dump.sh"
end

