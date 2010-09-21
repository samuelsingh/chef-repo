
set_unless[:hudson_server][:version]           = "hudson-current"
set_unless[:hudson_server][:install_path]      = "/var/tomcat/server9001"
set_unless[:hudson_server][:war_path]          = "/var/hudson/deploy-wars"
set_unless[:hudson_server][:home]              = "/var/hudson"
set_unless[:hudson_server][:run_user]          = "tomcat"

