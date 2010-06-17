name "its-users"
description "Configures apache vhosts for production use"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[users]"

override_attributes(
  "users" => {
    "dev" => {
      "uid" => "10050",
      "pwd_hash" => "$6$4ISvjUwR$bLbEGpG/MICpxG0ClsfLcVT6z4xpXx5mNGSthQJPe5k7foSU5CIgKROaEFLHo/cR1hiCK8G3LJgQ1yiJ2ec7G.",
      "is_admin" => "true"
    },
    "qa" => {
      "uid" => "10051",
      "pwd_hash" => "$6$jgOD2XJL$tj4kFESJ/8FcFn5B0KqE8hr/GfiS6f1fgU7DPHq2oHuz1xXEw9AT1w3jB.OudLMgpM/sP4LXyuNr.57/jserq/",
      "is_admin" => "true"
    }
  }
)
