name "jruby-celerity"
description "Configures Quova"

run_list "recipe[java]", "recipe[jruby]", "recipe[jruby::gem]"


override_attributes(
  "jruby" => {
    "gems" => ["celerity"]
  }
)
