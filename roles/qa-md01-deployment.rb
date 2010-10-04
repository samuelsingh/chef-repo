name "qa-md01-deployment"
description "Configuration specific to a given QA deployment of Map Display"

override_attributes(
  "map_display" => {
  "version" => "2.7.0-2010-10-01_13-10-07-36704",
  "md_fqdn" =>  "qa-md01.map-cloud-01.eu",
  "deploy_dir" =>  "/var/shared/deployment/qa/md01",
  "dbhost" => "stage-db-02.map-cloud-01.eu",
  "dbname" => "qa_md01"
  }
)
