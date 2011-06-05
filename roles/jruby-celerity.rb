name "jruby-celerity"
description "Configures jruby + celerity"

run_list "recipe[java]", "recipe[jruby]", "recipe[jruby::gem]"


override_attributes(
  "jruby" => {
    "gems" => ["celerity"]
  }
)
