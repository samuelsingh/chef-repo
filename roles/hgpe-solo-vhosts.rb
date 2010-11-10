name "hgpe-solo-vhosts"
description "Configures HG / MDE vhosts"

run_list "recipe[hg-mde-vhost]"

override_attributes(
  "hg_mde_vhost" => {
    "healthguides.solo.mapofmedicine.com" => {
      "srv_aliases" => [],
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
    "eng.solo.mapofmedicine.com" => {
      "srv_aliases" => ["stage-eng.map-cloud-01.eu", "stage-nhsevidence.mapofmedicine.com"],
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
