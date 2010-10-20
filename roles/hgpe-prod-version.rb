name "hgpe-prod-version"
description "Specifies the HG and MDE versions currently used in production"

run_list "recipe[prod-server]"

override_attributes(
  "hg_mde" => {
    "hg_version" =>  "choices.R12.2-Issue_3_2010-100730.183004.769.d1v1r46-September_2010_101018.130659.518.d3v17r4255-hudson-HG-build-appfuse-34-36875",
    "mde_version" =>  "evidence.R4.1-Issue_3_2010-100730.183004.769.d1v1r46-September_2010_101018.130659.518.d3v17r4255-hudson-HG-build-appfuse-34-36875"
  }
)
