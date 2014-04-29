#networking
default['rabbitmq']['web_console_ssl_port'] = "8080"  
default['rabbitmq']['tcp_listener_custom']= "9999"

# clustering
default['rabbitmq']['cluster'] = false 
default['rabbitmq']['cluster_disk_nodes'] = ['rabbit@rabbitmq3','rabbit@rabbitmq4']
default['rabbitmq']['erlang_cookie'] = 'AnyAlphaNumericStringWillDo'
default['rabbitmq']['cluster_partition_handling'] = 'ignore'

# see https://github.com/opscode-cookbooks/rabbitmq/blob/master/attributes/default.rb for more attributes.

