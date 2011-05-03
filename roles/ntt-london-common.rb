name "ntt-london-common"
description "Configuration common to all machines in map-cloud-01.eu. V0.2"
run_list "recipe[standard_users]", "recipe[exim::satellite]", "recipe[extra-repos]"
