name "qa-md01-deployment"
description "Configuration specific to a given QA deployment of Map Display"

override_attributes(
  "map_display" => {
    "version" => "0.0.0",
    "md_fqdn" =>  "qa-md01.map-cloud-01.eu",
    "dbhost" => "stage-db-01.map-cloud-01.eu",
    "dbname" => "qa_md01",
    "dbpass" => "MtMUs3r"	
  },
  "fabric_deployment" => {
    "environment" => "qa-md01"
  }
)
