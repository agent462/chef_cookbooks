maintainer       "Best Buy, Inc."
maintainer_email "bryan.brandau@bestbuy.com"
license          "Apache 2.0"
description      "Installs JBoss"
version          "0.1"
supports         "Ubuntu"

%w{ java ziptools }.each { |cb| 
  depends cb
}
