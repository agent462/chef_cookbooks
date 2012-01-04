# Array of addresses to ping
default[:mtr][:ip_addresses]    = ["127.0.0.1"]

# Ping Count
default[:mtr][:ping_number]     = "10"
default[:mtr][:packet_size]     = "1024"
default[:mtr][:include_dns]     = false

# Directories
default[:mtr][:cron_file_path]  = "/opt/mtr"
default[:mtr][:log_directory]   = "/var/log/mtr"
default[:mtr][:mtr_location]    = "/usr/bin/mtr"

# Cron settings for the mtr
default[:mtr][:cron][:minute]   = "*/5" # Every 5 minutes
default[:mtr][:cron][:hour]     = "*"
default[:mtr][:cron][:day]      = "*"
default[:mtr][:cron][:month]    = "*"
default[:mtr][:cron][:weekday]  = "*"