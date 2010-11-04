name "hgpe-stage-appserver"
description "Configures HG / MDE application server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[hg-mde]"

override_attributes(
  "tomcat" => {
    "unpackwars" => "true"
  },
  "hg_mde" => {
    "hg_war_path" =>  "/var/shared/deployment/stage/healthguides/wars",
    "mde_war_path" =>  "/var/shared/deployment/stage/mde/wars"
  }
)
