name "stage-euromd-appserver"
description "Configures Stage MD application server"

run_list "role[tomcat]", "recipe[tomcat::rotate_logs]", "recipe[map-display]", "recipe[map-display::contentloader]"

override_attributes(
  "map_display" => {
    "md_fqdn" =>  "euromd.regression.mapofmedicine.com",
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
  },
  "tomcat" => {
    "srv_dir" => "/var/tomcat",
    "log_rotate_dir" => "/var/shared/rotated-logs"
  }
)
