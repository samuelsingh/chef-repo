directory "/var/tmp/samuelsingh" do
  owner "root"
  group "root"
  mode 00644
  action :create
end


directory "/var/tmp/James" do
  owner "root"
  group "sysadmin"
  mode 00644
  action :create
end


directory "/var/tmp/ss" do
  owner "root"
  group "root"
  mode 00644
  action :delete
end


%w{sam pam cam}.each do |dir|
directory "/tmp/#{dir}" do
mode 00775
owner "root"
group "root"
recursive true
end
end
