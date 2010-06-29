name "internal-vhosts"
description "Configures apache vhosts for internal production use"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[generic-tomcat-vhost]"

override_attributes(
  "generic_tomcat_vhost" => {
    "knowledge.mapofmedicine.com" => {
      "srv_aliases" => ["knowledge.map-cloud-01.eu"],
      "webapps" => {
        "confluence" => {
          "port" => "9001",
          "appserver" => "jirawiki-app-01.map-cloud-01.eu"
        }
      },
      "primary_webapp" => "confluence",
      "restricted_ips" => [],
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause."
    },
    "tracking.mapofmedicine.com" => {
      "srv_aliases" => ["tracking.map-cloud-01.eu"],
      "webapps" => {
        "jira" => {
          "port" => "9002",
          "appserver" => "jirawiki-app-01.map-cloud-01.eu"
        }
      },
      "primary_webapp" => "jira",
      "restricted_ips" => [],
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause."
    }
  }
)
