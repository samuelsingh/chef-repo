name "contentuat-euromd-appserver"
description "Configures application server for content uat"

run_list "recipe[java]", "recipe[tomcat]", "recipe[tomcat::rotate_logs]", "recipe[map-display]", "recipe[map-display::contentloader]"

override_attributes(
  "map_display" => {
    "md_fqdn" =>  "euromd.contentuat.mapofmedicine.com",
    "deploy_dir" =>  "/var/shared/deployment/stage/euro-md",
    "dbhost" => "stage-db-02.map-cloud-01.eu",
    "dbname" => "uat_mtmdb",
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
