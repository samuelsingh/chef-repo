name "java_builder"
description "Hudson node for building Java applications"

# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list "recipe[java]", "recipe[java_builder]", "recipe[hudson_agent]"

