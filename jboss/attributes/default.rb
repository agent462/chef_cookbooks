# Version of JBoss.  Only 5.1.0.GA has been tested
default[:jboss][:version]               = "5.1.0.GA"
default[:jboss][:file_version]          = "5.1.0.GA-jdk6"
default[:jboss][:file_checksum]         = "bee49ee4dd833e6cfa6"

# User and Group for JBoss
default[:jboss][:user]                  = "jboss"
default[:jboss][:group]                 = "jboss"

# Installation directories and home locations
default[:jboss][:install_base]          = "/opt"
default[:jboss][:home]                  = "/opt/jboss"
default[:jboss][:console_log]           = "/opt/jboss/log/console.log"

# Bind JBoss services to this address
default[:jboss][:bind_host]             = "0.0.0.0"

# Server configuration to use default, minimal, all
default[:jboss][:server_name]           = "default"

# JNDI address and port
default[:jboss][:jboss_jndi_port]       = "1099"
default[:jboss][:jboss_jndi_addr]       = "localhost"

# JMX console credentials
default[:jboss][:jboss_admin_user]      = "admin"
default[:jboss][:jboss_admin_pass]      = "admin"

# Location of JBoss PID file
default[:jboss][:jboss_pidfile]         ="/var/run/jboss/jboss.pid"
