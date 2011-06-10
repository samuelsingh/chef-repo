name "prod_jenkins_server"
description "Map of Medicine Hudson deployment server"

run_list "role[tomcat]", "recipe[hudson_server]"

override_attributes(
  "tomcat" => {
    "unpackwars" => "true",
    "ajp_ports" => [9001]
  },
  "glusterfs" => {
    "client" => {
      "iocache" => "16"
    }
  }
)
