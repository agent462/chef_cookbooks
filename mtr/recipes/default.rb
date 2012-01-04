#
# Cookbook Name::mtr
# Recipe::default
#
# Copyright 2011-2012, BBY Solutions, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Create the Cron Directory
directory node[:mtr][:cron_file_path] do
  recursive true
end

# Create the Log Directory
directory node[:mtr][:log_directory] do
  recursive true
end

# Move the MTR template over
template "Copying MTR file" do
  path "#{node[:mtr][:cron_file_path]}/mtr.rb"
  source "mtr.rb.erb"
  owner "root"
  group "root"
  mode 0755
  variables(
    :ip_addresses => node[:mtr][:ip_addresses],
    :log_directory => node[:mtr][:log_directory],
    :mtr_location => node[:mtr][:mtr_location],
    :include_dns => node[:mtr][:include_dns],
    :ping_number => node[:mtr][:ping_number],
    :packet_size => node[:mtr][:packet_size]
  )
end

# Setup the cron job according to user specifications
cron "MTR" do
  command "#{node[:mtr][:cron_file_path]}/mtr.rb"
 
  minute "#{node[:mtr][:cron][:minute]}"
  hour "#{node[:mtr][:cron][:hour]}"
  day "#{node[:mtr][:cron][:day]}"
  month "#{node[:mtr][:cron][:month]}"
  weekday "#{node[:mtr][:cron][:weekday]}"
end