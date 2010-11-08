name "hgpe-stage-version"
description "Specifies the HG and MDE versions currently used in production"

run_list "recipe[prod-server]"

override_attributes(
 "hg_mde" => {
   "hg_version" =>  "choices.R13.1-Issue_3a_2010-100730.183004.769.d1v1r46-September_2010_101018.130659.518.d3v17r4255-hudson-HG-build-appfuse-40-37037",
    "mde_version" => "evidence.R5.1-Issue_3a_2010-100730.183004.769.d1v1r46-September_2010_101018.130659.518.d3v17r4255-hudson-HG-build-appfuse-40-37037"
  }
)
