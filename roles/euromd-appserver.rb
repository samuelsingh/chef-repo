name "euromd-appserver"
description "Configures Live MD application server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[map-display]", "recipe[map-display::contentloader]"

override_attributes(
  "map_display" => {
    "md_fqdn" =>  "euro-md.map-cloud-01.eu",
    "deploy_dir" =>  "/var/shared/deployment/prod/euro-md",
    "dbhost" => "md-db-01.map-cloud-01.eu",
    "dbname" => "live_mtmdb",
    "dbuser" => "mtmuser",
    "dbpass" => "medic1"
  }
)
