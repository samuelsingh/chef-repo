name "hgpe-vhosts"
description "Configures HG / MDE vhosts"

run_list "recipe[hg-mde-vhost]"

override_attributes(
  "hg_mde_vhost" => {
    "healthguides.mapofmedicine.com" => {
      "srv_aliases" => ["healthguides.map-cloud-01.eu"],
      "webapps" => {
        "choices" => {
          "port" => "9001",
          "appserver" => "127.0.0.1"
        }
      },
      "primary_webapp" => "choices",
      "webapp_base" => "/var/tomcat/server9001/webapps",
      "restricted_ips" => [],
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause."
    },
    "directaccess.mapofmedicine.com" => {
      "srv_aliases" => ["eng.map-cloud-01.eu", "nhsevidence.mapofmedicine.com","eng.mapofmedicine.com"],
      "webapps" => {
        "evidence" => {
          "port" => "9002",
          "appserver" => "127.0.0.1"
        }
      },
      "primary_webapp" => "evidence",
      "webapp_base" => "/var/tomcat/server9002/webapps",
      "restricted_ips" => [],
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause."
    }
  }
)
