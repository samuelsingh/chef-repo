#
# Cookbook Name:: apache2
# Attributes:: rotate_logs
#

# Minute is randomised to try to avoid galloping herd syndrome
set_unless[:apache][:rotate_hour] = "1"
set_unless[:apache][:rotate_min] = rand(59).to_s
