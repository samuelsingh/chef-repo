
set[:hudson_agent][:server_url] = "http://hudson-01.map-cloud-01.eu:8080/hudson"
set[:hudson_agent][:home_dir] = "/var/hudson-agent"

set[:hudson_agent][:user] = "hudson"
set[:hudson_agent][:group] = "hudson"

set[:hudson_agent][:jvm][:max_heap] = "1250m"
set[:hudson_agent][:jvm][:start_heap] = "1250m"

