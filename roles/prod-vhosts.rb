name "prod-vhosts"
description "Configures apache vhosts for production use"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[prod-server]","recipe[mms-vhost]"

override_attributes(
  "mms_vhost" => {
    "mms.mapofmedicine.com" => {
      "srv_aliases" => [],
      "deploy_dir" => "/var/shared/deployment/prod/root-mms",
      "appserver" => "rootmms-app-01.map-cloud-01.eu",
      "restricted_ips" => [],
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
      "lb_alive_port" => 0
    },
    "localise.map-cloud-01.eu" => {
      "srv_aliases" => ['clientmms.uat.mapofmedicine.com'],
      "deploy_dir" => "/var/shared/deployment/prod/client-mms",
      "appserver" => "clientmms-app-01.map-cloud-01.eu",
      "restricted_ips" => [],
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
      "lb_alive_port" => 0
    },
    "training-mms.mapofmedicine.com" => {
      "srv_aliases" => ["training-mms.map-cloud-01.eu"],
      "deploy_dir" => "/var/shared/deployment/training-mms",
      "appserver" => "trainingmms-app-01.map-cloud-01.eu",
      "restricted_ips" => [],
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
      "lb_alive_port" => 0
    }
  }
)
