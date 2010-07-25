#
# Cookbook Name:: hgdmde 
# Attributes:: hgmde 
#

# war
set_unless[:hgmde][:version]           = "healthguides-20100316"
set_unless[:hgmde][:install_path]      = "/var/tomcat/server9001"
set_unless[:hgmde][:run_user]          = "tomcat"
