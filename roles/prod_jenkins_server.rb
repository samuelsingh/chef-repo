name "prod_jenkins_server"
description "Map of Medicine Jenkins deployment server"

run_list "role[tomcat]", "recipe[jenkins_server]"

override_attributes(
  "tomcat" => {
    "unpackwars" => "true",
    "ajp_ports" => [9001]
  },
  "jenkins_server" => {
    "java_opts" => "-server -Xmx256m -Djava.awt.headless=true"
  },
  "glusterfs" => {
    "client" => {
      "iocache" => "16"
    }
  }
)
