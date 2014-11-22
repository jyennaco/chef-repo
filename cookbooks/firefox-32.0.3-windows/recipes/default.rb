#
# Cookbook Name:: firefox-32.0.3-windows
# Recipe:: default
#
# Copyright 2014, JackpineTech
#

windows_package 'Mozilla Firefox 32.0.3 (x86 en-US)' do
  source 'c:/install_media/Firefox Setup 32.0.3.exe'
  options '-ms'
  installer_type :custom
  action :install
end