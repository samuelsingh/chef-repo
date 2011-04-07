
set[:hudson_agent][:server_url] = "http://hudson-01.map-cloud-01.eu:8080/hudson"
set[:hudson_agent][:home_dir] = "/var/hudson-agent"

set_unless[:hudson_agent][:user] = "hudson"
set_unless[:hudson_agent][:group] = "hudson"

set[:hudson_agent][:jvm][:max_heap] = "256m"
set[:hudson_agent][:jvm][:start_heap] = "256m"

