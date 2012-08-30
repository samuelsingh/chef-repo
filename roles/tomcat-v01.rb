name "tomcat-v01"
description "Configures Apache Tomcat 6 application server"

run_list "recipe[tomcat]", "recipe[tomcat::rotate_logs]" 

override_attributes(
  "tomcat" => {
    "srv_dir" => "/var/tomcat",
    "log_rotate_dir" => "/var/shared/rotated-logs"
  }
)
