name "quova-server"
description "Configures Quova"

run_list "recipe[java]", "recipe[quova]"

