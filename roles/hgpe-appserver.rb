name "hgpe-appserver"
description "Configures HG / MDE application server"

run_list "role[tomcat]", "recipe[hg-mde]", "recipe[jenkins_agent]"

override_attributes(
  "tomcat" => {
    "unpackwars" => "true"
  },
  "hg_mde" => {
    "hg_war_path" =>  "/var/shared/deployment/prod/healthguides/wars",
    "mde_war_path" =>  "/var/shared/deployment/prod/mde/wars",
    "specify_docbase" => "false"
  },
  "jenkins_agent" => {
    "user" => "tomcat",
    "group" => "tomcat",
    "jvm" => {
      "java_opts" => "-server -Xmx64m -Djava.awt.headless=true"
    },
    "server_url" => "http://jenkins-02.map-cloud-01.eu:8080/jenkins"
  }
)
