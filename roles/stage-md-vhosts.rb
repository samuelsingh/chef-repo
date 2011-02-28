name "stage-md-vhosts"
description "Configures apache vhosts for MD staging use"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[map-display-vhost]", "recipe[lpa-vhost]", "recipe[stage-server]"

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
    "euromd.contentuat.mapofmedicine.com" => {
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
    "euromd.test.mapofmedicine.com" => {
      "srv_aliases" => ['localcare.test.mapofmedicine.com'],
      "deploy_dir" => "/var/tmp",
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
      "appserver" => "builder-04.map-cloud-01.eu",
      "lb_alive_port" => 0,
      "static_offload" => false,
      "lpa_hostname" => "localcare.test.mapofmedicine.com",
      "mom_port" => "8009",
      "aa_port" => "8009"
    },
    "qa-md02.map-cloud-01.eu" => {
      "srv_aliases" => [],
      "deploy_dir" => "/var/shared/fabric-pipeline/deploy/qa-md02/DEPLOYED",
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
      "appserver" => "qa-md02-app-01.map-cloud-01.eu",
      "lb_alive_port" => 0
    },
"stage-md.map-cloud-01.eu" => {
       "srv_aliases" => ["euromd.stage.mapofmedicine.com"],
       "deploy_dir" => "/var/shared/deployment/stage/stage-md",
       "holding_page" => "false",
       "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance. We apologise for any inconvenience this may cause.",
        "appserver" => "stage-md-app-01.map-cloud-01.eu",
        "lb_alive_port" => 0
      }
  },
  "lpa_vhost" => {
    "localcare.regression.mapofmedicine.com" => {
      "srv_aliases" => ["localcare.uat.mapofmedicine.com"],
      "deploy_dir" => "/var/shared/deployment/stage/euro-md",
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
      "appserver" => "stage-euromd-app-01.map-cloud-01.eu",
      "lb_alive_port" => 0
    }
  },
)
