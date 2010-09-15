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

remote_file "/var/svn/map-dev/hooks/post-commit" do
  source "post-commit-dev"
  mode 0755
  owner "www-data"
  group "www-data"
  only_if "test -d /var/svn/map-dev/hooks"
end

remote_file "/var/svn/map-sys/hooks/post-commit" do
  source "post-commit-sys"
  mode 0755
  owner "www-data"
  group "www-data"
  only_if "test -d /var/svn/map-sys/hooks"
end

remote_file "/usr/local/sbin/fabric-pipeline-svn-notify" do
  source "fabric-pipeline-svn-notify"
  mode 0755
end

remote_file "/usr/local/sbin/fabric-pipeline-trigger-build" do
  source "fabric-pipeline-trigger-build"
  mode 0755
end

remote_file "/usr/local/sbin/svn_backup.sh" do
  source "svn_backup.sh"
  mode 0755
end

cron "svn_backup" do
  hour "20"
  minute "30"
  command "/usr/local/sbin/svn_backup.sh"
end

