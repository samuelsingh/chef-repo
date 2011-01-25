name "prod-corporate-site"
description "Configures modx to host the corporate site"
run_list "role[web-server]", "recipe[modx-revolution]"

override_attributes(
  "modx" => {
    "dbuser" => "modx",
    "dbpass" => "ai9Aebo2",
    "dbhost" => "confluencedb.cmn42a62dcbh.eu-west-1.rds.amazonaws.com",
    "dbname" => "modx",
    "hostname" => "mapofmedicine.com",
    "deployment_home" => "/var/shared/deployment/prod/corporate-site",
    "srv_aliases" => []
  }
)