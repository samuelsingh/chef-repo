name "stage-clientmms-appserver-v01"
description "Configures Stage Client MMS application server-v01"

run_list "recipe[java]", "role[tomcat]", "recipe[map-display-3::application]", "recipe[map-display-3::contentloader]", "recipe[map-display-3::rotate_logs]"


override_attributes(
  "map_display" => {
    "common" => {
      "dbhost" => "stage-db-02.map-cloud-01.eu",
      "dbname" => "mapmanager_mcs",
      "dbuser" => "mtmuser",
      "dbpass" => "medic1"
    },
    "application" => {
      "md_fqdn" =>  "localise.regression.mapofmedicine.com",
      "geoip_server" => "geoip.mapofmedicine.com",
      "save_ram" => "true"
    },
    "contentloader" => {
      "path" => "/usr/local/contentloader",
      "dist_path" => "/usr/local/contentloader-dist"
    }
  },
  "tomcat" => {
    "srv_dir" => "/var/tomcat",
    "log_rotate_dir" => "/var/shared/rotated-logs",
    "unpackwars" => "true"
  }
)
