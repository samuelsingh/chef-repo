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



package "apache2" do
  case node[:platform]
  when "centos","redhat","fedora","suse"
    package_name "httpd"
  when "debian","ubuntu"
    package_name "apache2"
  end
  action :install
end






%w{rover fido bubbers}.each do |pet_name|
  execute "feed_pet_#{pet_name}" do
    command "echo 'Feeding: #{pet_name}'; touch '/tmp/#{pet_name}'"
    not_if { ::File.exists?("/tmp/#{pet_name}")}
  end
end




