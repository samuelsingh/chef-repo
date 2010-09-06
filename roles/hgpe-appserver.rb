name "hgpe-appserver"
description "Configures HG / MDE application server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[hg-mde]"

override_attributes(
  "tomcat" => {
    "unpackwars" => "false"
  },
  "hg_mde" => {
    "hg_shared" =>  "/var/shared/deployment/healthguides",
    "mde_shared" =>  "/var/shared/deployment/mde"
  }
)