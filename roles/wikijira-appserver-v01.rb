name "wikijira-appserver-v01"
description "Configures Jira/Wiki application server"

run_list "recipe[tomcat::rotate_logs]", "role[confluence::confluence-v01.rb]", "role[jira::jira-v01.rb]"

override_attributes(
  "tomcat" => {
    "srv_dir" => "/var/tomcat",
    "log_rotate_dir" => "/var/shared/rotated-logs"
  }
)
