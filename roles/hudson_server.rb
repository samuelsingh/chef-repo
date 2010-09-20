name "hudson_server"
description "Map of Medicine Hudson deployment server"

# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[java]", "recipe[tomcat]", "recipe[hudson_server]"

override_attributes(

  :hudson_server => {
	"home" => "/var/hudson",
	"deploy_dir" => "/var/shared/deployment/"
  }
)
