#
# Cookbook Name:: web_application
# Recipe:: wordpress
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'web_application'

# Delete files at the apache docroot
#directory node['apache']['docroot_dir'] do
#  recursive true
#  action :delete
#end

# Create the document root.
#directory node['apache']['docroot_dir'] do
#  recursive true
#  user node['web_application']['user']
#  group node['web_application']['group']
#  mode '0755'
#  notifies :restart, 'service[apache2]'
#end

# Delete the existing sample index.php file
#file "#{node['apache']['docroot_dir']}/index.php" do
#  action :delete
#end

# Extract wordpress to the apache root directory
tar_extract node['web_application']['wordpress']['url'] do
  target_dir node['apache']['docroot_dir']
  creates File.join(node['apache']['docroot_dir'], 'wp-config-sample.php')
  #user node['web_application']['user']
  #group node['web_application']['group']
  tar_flags [ '--strip-components 1' ]
  not_if { ::File.exists?("#{node['apache']['docroot_dir']}/wp-config-sample.php") }
end

# Load the secrets file and the encrypted data bag item that holds the database password.
password_secret = Chef::EncryptedDataBagItem.load_secret("#{node['web_application']['passwords']['secret_path']}")

# Load the encrypted database user password
user_password_data_bag_item = Chef::EncryptedDataBagItem.load("#{node['web_application']['passwords']['data_bag']}",
                                                              "#{node['web_application']['database']['app']['username']}",
                                                              password_secret)

# Add the wp-config.php configuration file
template "#{node['apache']['docroot_dir']}/wp-config.php" do
  source 'wp-config.php.erb'
  #mode '0644'
  #owner node['web_application']['user']
  #group node['web_application']['group']
  variables({
                :database_password => user_password_data_bag_item['password']
            })
end