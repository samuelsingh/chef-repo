name "hgpe-prod-version"
description "Specifies the HG and MDE versions currently used in production"

override_attributes(
  "hg_mde" => {
    "hg_version" =>  "healthguides-20100316",
    "mde_version" =>  "evidence-20100623"
  }
)
