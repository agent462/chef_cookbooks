# Location and name of the chef client.rb
default[:chef_handler_splunk][:client_directory]            = "/etc/chef"
default[:chef_handler_splunk][:config_file]                 = "client.rb"
default[:chef_handler_splunk][:log_directory]               = "/var/chef/splunk"
default[:chef_handler_splunk][:number_backups]              = 10