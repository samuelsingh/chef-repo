name "jira"
description "Configures jira"

run_list "recipe[jira_mom]"

override_attributes(
  "jira" => {
    "run_user" => "tomcat",
    "database_host" => "jiradb",
    "version" => "atlassian-jira-4.1.2",
    "database" => "mysql",
    "database_user" => "jira_user",
    "install_path" => "/var/tomcat/server9002",
    "database_password" => "medic1"
  }
)
