#
# Cookbook Name:: snapshot_ebs
# Attributes:: snapshot_ebs
set :snapshot_ebs => {
    :install_path => "/usr/local/bin",
    :volumes => [
	{ :name => "mddb01",     :volume_id => "vol-fe976d97", :retention => "35" },
	{ :name => "lightmms01", :volume_id => "vol-9a956ff3", :retention => "35" },
	{ :name => "filer01",    :volume_id => "vol-58957f31", :retention => "35" },
	{ :name => "svn01",      :volume_id => "vol-b844bbd1", :retention => "35" },
	{ :name => "hudson01",   :volume_id => "vol-acfc3cc5", :retention => "35" }
    ]
  }


