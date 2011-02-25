name "stage-md-appserver"
description "Configures Stage MD application server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[map-display]", "recipe[map-display::contentloader]"

override_attributes(
  "map_display" => {
    "md_fqdn" =>  "stage-app.mapofmedicine.com",
    "deploy_dir" =>  "/var/shared/deployment/stage/stage-md",
    "dbhost" => "stage-db-02.map-cloud-01.eu",
    "dbname" => "stage_mtmdb",
    "dbuser" => "mtmuser",
    "dbpass" => "medic1"
  }
)

