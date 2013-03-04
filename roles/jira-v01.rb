name "jira-v01"
description "Configures jira"

run_list "recipe[jira_mom::jira-v01]"

override_attributes(
  "jira" => {
    "run_user" => "tomcat",
    "database_host" => "newjiradb",
    "version" => "atlassian-jira-5.2.7",
    "database" => "mysql",
    "database_user" => "jira_user",
    "install_path" => "/var/tomcat/server9002",
    "database_password" => "medic1"
  }
)
