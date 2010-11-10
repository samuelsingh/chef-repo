name "hgpe-solo-appserver"
description "Configures HG / MDE application server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[hg-mde]"

override_attributes(
  "tomcat" => {
    "unpackwars" => "true"
  }
)
