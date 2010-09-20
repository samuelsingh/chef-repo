
set_unless[:hudson][:version]           = "hudson-current"
set_unless[:hudson][:install_path]      = "/var/tomcat/server9001"
set_unless[:hudson][:war_path]          = "/var/shared/deployment/hudson/wars"
set_unless[:hudson][:home]              = "/var/hudson"
set_unless[:hudson][:run_user]          = "tomcat"

