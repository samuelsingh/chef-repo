name "prod-jenkins-agent"
description "Lightweight Jenkins agent install for small tasks"

run_list "recipe[jenkins_agent]"

override_attributes(
  "jenkins_agent" => {
    "user" => "tomcat",
    "group" => "tomcat",
    "jvm" => {
      "java_opts" => "-server -Xmx64m -Djava.awt.headless=true"
    },
    "server_url" => "http://jenkins-02.map-cloud-01.eu:8080/jenkins"
  }
)
