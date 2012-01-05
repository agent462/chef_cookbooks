Description
===========

This Chef cookbook installs the chef_handler_splunk from https://github.com/adamhjk/chef_handler_splunk and adds it to the client.rb.  This will only work for instances that do not have the client.rb modified under a different cookbook.  Otherwise you will have conflicts between the cookbook version and this version -- both will modify the files on every chef run.

Changes
=======

v0.0.1 - Initial Release

Attributes
==========

See `attributes/default.rb` for default values.

* `node['chef_handler_splunk']['client_directory']` - The directory location of the client.rb file
* `node['chef_handler_splunk']['config_file']` - The name of the config file that needs the handler (usually client.rb)
* `node['chef_handler_splunk']['log_directory']` - The directory to store the log files created from chef_handler_splunk
* `node['chef_handler_splunk']['number_backups']` - The number of backups to keep


Recipes
=======

default
------

Installs the chef_handler_splunk gem and configures the client.rb

Usage
=====

	recipe[chef_handler_splunk]

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