#
# Cookbook Name:: hgdmde 
# Attributes:: hgmde 
#

# war
set_unless[:hgmde][:hg_version]           = "healthguides-20100316"
set_unless[:hgmde][:hg_install_path]      = "/var/tomcat/server9001"
set_unless[:hgmde][:run_user]          = "tomcat"
set_unless[:hgmde][:hg_war_path]          = "/var"
set_unless[:hgmde][:mde_version]           = "evidence-20100623"
set_unless[:hgmde][:mde_install_path]      = "/var/tomcat/server9002"
set_unless[:hgmde][:mde_war_path]          = "/var"
