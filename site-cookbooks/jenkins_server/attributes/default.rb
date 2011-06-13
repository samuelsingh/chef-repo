
set[:jenkins_server][:version]           = "jenkins"
set[:jenkins_server][:install_path]      = "/var/tomcat/server9001"
set[:jenkins_server][:war_path]          = "/var/jenkins/deploy-wars"
set[:jenkins_server][:home]              = "/var/jenkins"
set[:jenkins_server][:run_user]          = "tomcat"
set_unless[:jenkins_server][:java_opts] = "-server -Xmx768m -Djava.awt.headless=true"

