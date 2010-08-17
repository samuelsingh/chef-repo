#
# Cookbook Name:: snapshot_ebs
# Attributes:: snapshot_ebs
set_unless[:snapshot_ebs][:install_path] = "/usr/local/bin"
set_unless[:snapshot_ebs][:mddb01][:volume]  = "vol-fe976d97"
set_unless[:snapshot_ebs][:mddb01][:retention] = "35"
set_unless[:snapshot_ebs][:lightmms01][:volume] = "vol-9a956ff3"
set_unless[:snapshot_ebs][:lightmms01][:retention] = "35"
set_unless[:snapshot_ebs][:filer01][:volume] = "vol58957f31"
set_unless[:snapshot_ebs][:filer01][:retention] = "35"
