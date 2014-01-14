name "map-cloud-01-eu-common-vSS"
description "Configuration common to all machines in map-cloud-01.eu. V0.5-for sachin samuel singh"
run_list "recipe[zones]", "recipe[glusterfs_3_1::server]", 