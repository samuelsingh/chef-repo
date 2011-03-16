name "test-euromd-appserver"
description "Configures test MD application server"

run_list "role[java_builder]", "role[tomcat]", "recipe[map-display-2]", "recipe[smoke_test]"

override_attributes(
  "map_display" => {
    "md_fqdn" => "euromd.test.mapofmedicine.com",
    "dbhost" => "stage-db-01.map-cloud-01.eu",
    "dbname" => "md-test",
    "dbuser" => "mtmuser",
    "dbpass" => "MtMUs3r",
    "save_ram" => "true"
  },
  "glusterfs" => {
    "client" => {
      "stable" => "true"
    }
  },
  "tomcat" => {
    "srv_dir" => "/var/tomcat",
    "log_rotate_dir" => "/var/shared/rotated-logs",
    "user_home" => "/var/hudson-agent",
    "unpackwars" => "true"
  },
  "hudson_agent" => {
    "user" => "tomcat",
    "group" => "tomcat"
  }
)
