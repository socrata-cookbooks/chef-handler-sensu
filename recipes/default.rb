#
# Copyright (C) 2015 sysadmin@socrata.com
#
# All rights reserved - Do Not Redistribute
#

directory "#{node[:chef_handler][:handler_path]}" do
  group 'sensu'
  user 'sensu'
  mode 0755
  action :create
end

cookbook_file "#{node[:chef_handler][:handler_path]}/chef-handler-sensu.rb" do
  source 'chef-handler-sensu.rb'
  mode 00600
end

chef_handler 'SensuCleaner' do
  source "#{node[:chef_handler][:handler_path]}/chef-handler-sensu.rb"
  action :enable
end
