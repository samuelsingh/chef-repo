name "hgpe-stage-appserver"
description "Configures HG / MDE application server"

run_list "role[tomcat]", "recipe[hg-mde]", "recipe[hudson_agent]"

override_attributes(
  "tomcat" => {
    "unpackwars" => "true"
  },
  "hg_mde" => {
    "hg_war_path" =>  "/var/shared/deployment/stage/healthguides/wars",
    "mde_war_path" =>  "/var/shared/deployment/stage/mde/wars",
    "specify_docbase" => "false"
  },
  "hudson_agent" => {
    "user" => "tomcat",
    "group" => "tomcat"
  }
)
