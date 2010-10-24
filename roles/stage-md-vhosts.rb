name "stage-md-vhosts"
description "Configures apache vhosts for MD staging use"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[map-display-vhost]"

override_attributes(
  "map_display_vhost" => {
    "stage-mdprov.map-cloud-01.eu" => {
      "srv_aliases" => ['euromd.regression.mapofmedicine.com','euromd.beta.mapofmedicine.com'],
      "deploy_dir" => "/var/shared/deployment/stage/euro-md",
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
      "appserver" => "stage-euromd-app-01.map-cloud-01.eu",
      "lb_alive_port" => 0
    },
    "stage-mdnoprov.map-cloud-01.eu" => {
      "srv_aliases" => [],
      "deploy_dir" => "/var/shared/deployment/stage/euro-md",
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
      "appserver" => "stage-euromd-app-02.map-cloud-01.eu",
      "lb_alive_port" => 0
    },
    "qa-md01.map-cloud-01.eu" => {
      "srv_aliases" => [],
      "deploy_dir" => "/var/shared/fabric-pipeline/deploy/qa-md01/DEPLOYED",
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
      "appserver" => "qa-md01-app-01.map-cloud-01.eu",
      "lb_alive_port" => 0
    },
    "qa-md02.map-cloud-01.eu" => {
      "srv_aliases" => [],
      "deploy_dir" => "/var/shared/fabric-pipeline/deploy/qa-md02/DEPLOYED",
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
      "appserver" => "qa-md02-app-01.map-cloud-01.eu",
      "lb_alive_port" => 0
    }
  }
)
