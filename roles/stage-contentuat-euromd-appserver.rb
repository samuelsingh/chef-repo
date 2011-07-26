name "stage-contentuat-euromd-appserver"
description "Configures Stage Content MD application server"

run_list "recipe[java]", "recipe[tomcat]", "role[web-server]", "recipe[map-display-3::application]", "recipe[map-display-3::contentloader]", "recipe[map-display-3::vhost]", "role[stage-jenkins-agent]"

override_attributes(
  "map_display" => {
    "common" => {
      "dbhost" => "stage-db-02.map-cloud-01.eu",
      "dbname" => "uat_mtmdb",
      "dbuser" => "mtmuser",
      "dbpass" => "medic1"
    },
    "application" => {
      "md_fqdn" =>  "stage-euromd-app-02.map-cloud-01.eu",
      "geoip_server" => "geoip.mapofmedicine.com",
      "save_ram" => "true"
    },
    "contentloader" => {
      "path" => "/usr/local/contentloader",
      "dist_path" => "/usr/local/contentloader-dist"
    },
    "vhost" => {
      "euromd.contentuat.mapofmedicine.com" => {
        "srv_aliases" => [],
        "holding_page" => "false",
        "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
        "appserver" => "127.0.0.1",
        "lb_alive_port" => 0
      }
    },
  "tomcat" => {
    "srv_dir" => "/var/tomcat",
    "log_rotate_dir" => "/var/shared/rotated-logs",
    "unpackwars" => "true"
  }
}
)


