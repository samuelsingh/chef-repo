name "stage euromd-md-appserver"
description "Configures CEP ContentUAT MD application server on the stage euromd server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[map-display]", "recipe[map-display::contentloader]"

override_attributes(
  "map_display" => {
    "md_fqdn" =>  "integration.mapofmedicine.com",
    "dbhost" => "stage-db-02.map-cloud-01.eu",
    "dbname" => "uat_mtmdb",
    "dbuser" => "mtmuser",
    "dbpass" => "medic1"
  }
)

