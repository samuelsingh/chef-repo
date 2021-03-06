name "hgpe-stage-vhosts"
description "Configures HG / MDE vhosts"

run_list "recipe[hg-mde-vhost::stage-hgpe-app-01_v01]"

override_attributes(
  "hg_mde_vhost" => {
    "healthguides.uat.mapofmedicine.com" => {
      "srv_aliases" => ["stage-healthguides.map-cloud-01.eu"],
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
    "eng.uat.mapofmedicine.com" => {
      "srv_aliases" => ["stage-eng.map-cloud-01.eu", "stage-nhsevidence.mapofmedicine.com", "directaccess.uat.mapofmedicine.com"],
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
