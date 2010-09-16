name "hgpe-prod-version"
description "Specifies the HG and MDE versions currently used in production"

override_attributes(
  "hg_mde" => {
    "hg_version" =>  "choices-20100819",
    "mde_version" =>  "evidence-20100819"
  }
)
