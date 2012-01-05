#
# Cookbook Name::jboss
# Recipe:: default
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

%w{ java_sun ziptools }.each { |cb| 
  include_recipe cb
}

user node[:jboss][:user] do
  comment "JBoss application user"
  shell "/bin/bash"
  action [:create, :lock]
end

group node[:jboss][:group] do
  members ["#{node[:jboss][:user]}"]
end

if File.exists?("/opt/jboss/readme.html") == false
  
  unpacked_dir = "#{node[:jboss][:install_base]}/jboss-#{node[:jboss][:version]}"

  unless FileTest.exists?(unpacked_dir)
    remote_file "/tmp/jboss.zip" do
      source "http://voxel.dl.sourceforge.net/project/jboss/JBoss/JBoss-#{node.jboss.version}/jboss-#{node.jboss.file_version}.zip"
      checksum "#{node.jboss.file_checksum}"
      owner node[:jboss][:user]
      mode 0644
    end

    directory unpacked_dir do
      owner node[:jboss][:user]
      group node[:jboss][:group]
      recursive true
    end

    bash "unpack jboss" do
      user node[:jboss][:user]
      cwd node[:jboss][:install_base]
      code <<-EOH
      unzip /tmp/jboss.zip
      EOH
    end

    link node[:jboss][:home] do
      to unpacked_dir
    end
  end
  
end

template "/etc/profile.d/jboss.sh" do
  source "jboss.sh.erb"
  owner "root"
  group "root"
  mode 0666
end

# Configure the service
directory "/var/run/jboss" do
  owner node[:jboss][:user]
  mode 0755
end

directory File.dirname(node[:jboss][:console_log]) do
  owner node[:jboss][:user]
  group node[:jboss][:group]
  mode 0755
  recursive true
end

template "/etc/default/jboss" do
  source "etc-default-jboss.erb"
  owner "root"
  group "root"
  mode 0644

end

template "/etc/init.d/jboss" do
  source "etc-init-jboss.erb"
  owner "root"
  group "root"
  mode 0755
end

template "/opt/jboss/bin/run.conf" do
  source "run.conf.erb"
  owner node[:jboss][:user]
  group node[:jboss][:group]
  mode 0644
end

template "/opt/jboss/server/default/conf/jboss-service.xml" do
  source "jboss-service.xml.erb"
  owner node[:jboss][:user]
  group node[:jboss][:group]
  mode 0644
end

service "jboss" do
  supports :status => true, :restart => true, :start => true, :stop => true, :reload => true
  action [ :enable, :start ]
end