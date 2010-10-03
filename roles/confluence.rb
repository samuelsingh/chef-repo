name "confluence"
description "Configures confluence"

run_list "recipe[confluence_mom]"

override_attributes(
  "confluence" => {
    "run_user" => "tomcat",
    "database_host" => "confluence-db",
    "version" => "confluence-3.3",
    "database" => "mysql",
    "database_user" => "confluence",
    "install_path" => "/var/tomcat/server9001",
    "database_password" => "ecneulfnoc"
  }
)
