name "hudson_server"
description "Map of Medicine Hudson deployment server"

# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[java]", "recipe[tomcat]", "recipe[hudson]"

override_attributes(

  :hudson => {
	:server => {
		:home = "/var/hudson"
	},
	:node  => {
		:launcher = "jnlp"
	}
)
