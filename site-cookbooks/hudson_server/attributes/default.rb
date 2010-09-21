
set[:hudson_server][:version]           = "hudson-current"
set[:hudson_server][:install_path]      = "/var/tomcat/server9001"
set[:hudson_server][:war_path]          = "/var/hudson/deploy-wars"
set[:hudson_server][:home]              = "/var/hudson"
set[:hudson_server][:run_user]          = "tomcat"

set[:tomcat][:ajp_ports]                = [9001]

