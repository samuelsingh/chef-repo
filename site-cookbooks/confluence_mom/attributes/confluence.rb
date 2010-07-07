#
# Cookbook Name:: confluence 
# Attributes:: confluence 
#

# type-version-ear/war
set_unless[:confluence][:version]           = "confluence-3.2.1_01"
set_unless[:confluence][:install_path]      = "/var/tomcat/server9001"
set_unless[:confluence][:run_user]          = "tomcat"
set_unless[:confluence][:database]          = "mysql"
set_unless[:confluence][:database_host]     = "confluence-db"
set_unless[:confluence][:database_user]     = "confluence"
set_unless[:confluence][:database_password] = "ecneulfnoc"
