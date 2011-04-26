#
# Cookbook Name:: modx-revolution
# Attributes:: apache
#

# Below are tuned apache2 attributes, to try to prevent uneven PHP performance.
# We may be able to open these up if we can get glusterfs to perform well with
# less cache memory.
#
# For more info on tuning, see http://www.devside.net/articles/apache-performance-tuning
#

# Prefork Attributes
set[:apache][:prefork][:startservers] = 20
set[:apache][:prefork][:minspareservers] = 10
set[:apache][:prefork][:maxspareservers] = 20
set[:apache][:prefork][:serverlimit] = 50
set[:apache][:prefork][:maxclients] = 50
set[:apache][:prefork][:maxrequestsperchild] = 20000