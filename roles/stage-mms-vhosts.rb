name "stage-mms-vhosts"
description "Configures apache vhosts for MMS staging"

run_list "recipe[mms-vhost]", "recipe[stage-server]"

override_attributes(
  "mms_vhost" => {
    "stage-trainmms.map-cloud-01.eu" => {
      "srv_aliases" => ['trainmms.regression.mapofmedicine.com','trainmms.beta.mapofmedicine.com'],
      "deploy_dir" => "/var/shared/deployment/stage/training-mms",
      "appserver" => "stage-trainmms-app-01.map-cloud-01.eu",
      "restricted_ips" => [],
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
      "lb_alive_port" => 0
    },
    "stage-rootmms.map-cloud-01.eu" => {
      "srv_aliases" => ['rootmms.regression.mapofmedicine.com','rootmms.beta.mapofmedicine.com','rootmms.uat.mapofmedicine.com'],
      "deploy_dir" => "/var/shared/deployment/stage/root-mms",
      "appserver" => "stage-rootmms-app-01.map-cloud-01.eu",
      "restricted_ips" => [],
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
      "lb_alive_port" => 0
    }
  }
)
