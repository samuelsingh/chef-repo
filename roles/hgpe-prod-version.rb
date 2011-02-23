name "hgpe-prod-version"
description "Specifies the HG and MDE versions currently used in production"

run_list "recipe[prod-server]"

override_attributes(
 "hg_mde" => {
   "hg_version" =>  "choices.r13.3.hudson-72.war",
    "mde_version" => "evidence.r5.3.hudson-72.war"
  }
)
