name "qa-md-appserver"
description "Configures an application server for an MD QA deployment"

# This is a generic role for any QA deployment of MD. Each deployment needs to
# have its own specific role for qa-mdXX-deployment, to define things unique to
# the deployment such as database

run_list "recipe[java]", "recipe[tomcat]", "recipe[map-display]", "recipe[map-display::contentloader]", "recipe[hudson_agent]", "recipe[fabric_deploy]", "recipe[glusterfs-client]"


