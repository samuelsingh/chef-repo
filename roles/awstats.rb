name "awstats"
description "Configures awstats"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[awstats]"

override_attributes(
  "awstats" => {
    "hostname" => "awstats.map-cloud-01.eu",
    "log_base" => "/var/shared/rotated-logs",
    "sites" => {
      "healthguides.mapofmedicine.com" => {
        "host_regex" => "hgpe-app-0[1-9]",
        "minute" => "25",
        "hour" => "5"
      },
      "eng.mapofmedicine.com" => {
        "host_regex" => "hgpe-app-0[1-9]",
        "minute" => "55",
        "hour" => "5"
      },
      "training-mms.mapofmedicine.com" => {
        "host_regex" => "prod-web-0[1-9]",
        "minute" => "25",
        "hour" => "1"
      },
      "mms.mapofmedicine.com" => {
        "host_regex" => "prod-web-0[1-9]",
        "minute" => "55",
        "hour" => "1"
      },
      "mapofmedicine.com" => {
        "host_regex" => "prod-web-0[1-9]",
        "minute" => "25",
        "hour" => "2"
      },
      "localise.mapofmedicine.com" => {
        "host_regex" => "prod-web-0[1-9]",
        "minute" => "55",
        "hour" => "2"
      }
    }
  }
)
