name "euromd-appserver"
description "Configures Live MD application server"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[java]", "recipe[tomcat]", "recipe[map-display]"

override_attributes(
  "map_display" => {
    "md_fqdn" =>  "app.map-cloud-01.eu",
    "deploy_dir" =>  "/var/shared/deployment/app",
    "db_host" => "md-db-01.map-cloud-01.eu",
    "db_name" => "live_mtmdb",
    "dbuser" => "mtmuser",
    "dbpass" => "medic1",
    "version" => "2.6.2.MD.8"
  }
)
