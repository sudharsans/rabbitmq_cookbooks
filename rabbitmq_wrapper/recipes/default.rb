#
# Cookbook Name:: rabbitmq_wrapper
# Recipe:: default
#
# Copyright 2014, Freshdesk 
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rabbitmq::default"

rabbitmq_plugin "rabbitmq_management" do
  action :enable
  notifies :restart, "service[rabbitmq-server]"
end

#modify rabbitmq config template
chef_gem "chef-rewind"
require 'chef/rewind'

unwind "template[#{node['rabbitmq']['config_root']}/rabbitmq.config]"

template "#{node['rabbitmq']['config_root']}/rabbitmq.config" do
  source 'rabbitmq.config.erb'
  owner 'root'
  group 'root'
  mode 00644
  notifies :restart, "service[rabbitmq-server]"
end

rabbitmq_user "guest" do
  action :delete
end

rabbitmq_user "freshdesk" do
  password "freshdesk"
  action :add
end

rabbitmq_user "freshdesk" do
  vhost "/"
  permissions ".* .* .*"
  action :set_permissions
end

rabbitmq_user "freshdesk" do
  tag "administrator"
  action :set_tags
end
