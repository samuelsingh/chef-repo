name "foxdev-common"
description "Configuration common to all hosts"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list "recipe[foxdev_mounts]"

# Attributes applied if the node doesn't have it set already.
#default_attributes()

# Attributes applied no matter what the node has set already.
#override_attributes()
