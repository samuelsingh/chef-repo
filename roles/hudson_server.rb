name "hudson_server"
description "Map of Medicine Hudson deployment server"

# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
# run_list "recipe[java]", "recipe[tomcat]", "recipe[hudson_server]", "recipe[nexus-sonar]", "recipe[mysql::server]"
run_list "recipe[java]", "recipe[tomcat]", "recipe[hudson_server]", "recipe[nexus]"

override_attributes(
  "tomcat" => {
    "unpackwars" => "true",
    "ajp_ports" => [9001,9002]
  },
  "nexus" => {
    "war" =>  "nexus-webapp-1.8.0.1.war",
    "home" =>  "/var/shared/deployment/nexus"
  },
  "sonar" => {
    "war" =>  "sonar-2.4.1.war",
    "home" =>  "/var/hudson/sonar",
    "dbuser" => "sonar",
    "dbpass" => "s0n4r",
    "dbhost" => "hudson-01.map-cloud-01.eu",
    "dbname" => "sonar"
  },
  "mysql" => {
    "server_root_password" =>  "Jorwegwi"
    #"datadir" =>  "/var/hudson/sonar/mysql"
  }
)
