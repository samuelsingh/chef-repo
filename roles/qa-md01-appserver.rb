name "qa-md01-appserver"
description "Configures QA MD01 application server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[map-display]", "recipe[map-display::contentloader]"

override_attributes "map_display" => {
  "md_fqdn" =>  "qa-md01.map-cloud-01.eu",
  "deploy_dir" =>  "/var/shared/deployment/qa/md01",
  "dbhost" => "stage-db-02.map-cloud-01.eu",
  "dbname" => "qa_md01"
}

