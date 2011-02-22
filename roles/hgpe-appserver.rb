name "hgpe-appserver"
description "Configures HG / MDE application server"

run_list "role[tomcat]", "recipe[hg-mde]"

override_attributes(
  "tomcat" => {
    "unpackwars" => "true"
  },
  "hg_mde" => {
    "hg_war_path" =>  "/var/shared/deployment/prod/healthguides/wars",
    "mde_war_path" =>  "/var/shared/deployment/prod/mde/wars"
  }
)
