name "map-svn-server"
description "Map of Medicine Subversion server"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[web-server]", "recipe[subversion]"

