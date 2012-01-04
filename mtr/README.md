Description
===========

This Chef cookbook sets up a cron job for MTR on a specific array of IP Addresses.  The original purpose of this was to create log files every X minutes and ingest the data into a Splunk Server.

Changes
=======

v0.0.1 - Initial Release

Attributes
==========

See `attributes/default.rb` for default values.

* `node['mtr']['ip_addresses']` - An array of IP Addresses
* `node['mtr']['ping_number']` - The number of times to ping each address
* `node['mtr']['packet_size']` - The size of the packet
* `node['mtr']['include_dns']` - Include the DNS name in the report
* `node['mtr']['cron_file_path']` - The directory to store the cron file that is to be executed
* `node['mtr']['log_directory']` - The directory to store the log files
* `node['mtr']['mtr_location']` - The location of the MTR executable
* `node['mtr']['cron']['minute']` - Cron Minute
* `node['mtr']['cron']['hour']` - Cron Hour
* `node['mtr']['cron']['day']` - Cron Day
* `node['mtr']['cron']['month']` - Cron Month
* `node['mtr']['cron']['weekday']` - Cron Weekday

Recipes
=======

default
------

Sets up the MTR cron job

Usage
=====

	recipe[mtr]

License and Author
==================

Author:: Andrew Painter (<Andrew.Painter@bestbuy.com>)

Copyright 2011-2012, BBY Solutions, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.