#
# Cookbook Name:: mms
# Recipe:: cron
#
# Copyright 2011, Map of Medicine
#

include_recipe "mms-2::application"
include_recipe "mms-2::helper-scripts"

bin = '/usr/local/bin'
sbin = '/usr/local/sbin'
lib = '/usr/local/lib'

qmgr_bin = "#{node[:mms][:common][:base]}/cs-batch/cs-bt.sh"

# Figures out whether or not this is a production server
node.run_list.run_list.flatten.member?("recipe[prod-server]") ? production_server = true : production_server = false

cron "rotate_mms_logs" do
  hour "#{node[:tomcat][:rotate_hour].to_i + 1}"
  minute node[:tomcat][:rotate_min]
  command "#{sbin}/gather-mms-logs.rb"
end

cron "clean_mms" do
  hour "#{node[:tomcat][:rotate_hour].to_i + 1}"
  minute "#{node[:tomcat][:rotate_min].to_i + 5}"
  command "#{sbin}/mmsclean"
end

if production_server
  
  # Start quartz queue at the end of working hours
  cron "start_qrtz_jobs" do
    hour 18
    minute 0
    #command "#{qmgr_bin} execute-all"
    command "echo \"`date` - this is when we'd start the quartz queue\" >> /tmp/qrtz.txt"
  end
  
  # Stop at beginning
  cron "stop_qrtz_jobs" do
    hour 7
    minute 0
    #command "#{qmgr_bin} stop-all"
    command "echo \"`date` - this is when we'd stop the quartz queue\" >> /tmp/qrtz.txt"
  end
  
  # Move any published packages to the right place
  cron "move_md_hg_packages" do
    hour 8
    minute 0
    command "#{sbin}/move-hg-packages.sh && #{sbin}/move-md-packages.sh app csc"
  end
  
end
