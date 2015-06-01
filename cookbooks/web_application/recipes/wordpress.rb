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

tar_extract node['web_application']['wordpress']['url'] do
  target_dir node['apache']['docroot_dir']
  creates File.join(node['apache']['docroot_dir'], 'index.php')
  user node['web_application']['user']
  group node['web_application']['group']
  tar_flags [ '--strip-components 1' ]
  not_if { ::File.exists?("#{node['apache']['docroot_dir']}/index.php") }
end