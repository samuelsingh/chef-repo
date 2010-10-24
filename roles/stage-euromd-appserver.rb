name "stage-euromd-appserver"
description "Configures Stage MD application server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[map-display]", "recipe[map-display::contentloader]"

override_attributes(
  "map_display" => {
    "deploy_dir" =>  "/var/shared/deployment/stage/euro-md",
    "dbhost" => "stage-db-02.map-cloud-01.eu",
    "dbname" => "prov_mtmdb",
    "dbuser" => "mtmuser",
    "dbpass" => "medic1"
  },
  "glusterfs" => {
    "client" => {
      "experimental" => "true"
    }
  }
)
