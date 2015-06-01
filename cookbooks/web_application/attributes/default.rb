

default['web_application']['user'] = 'web_admin'
default['web_application']['group'] = 'web_admin'

default['web_application']['name'] = 'ahmyoga'
default['web_application']['config'] = "#{node['web_application']['name']}.conf"

default['apache']['docroot_dir'] = "/srv/#{node['web_application']['name']}"

default['web_application']['passwords']['secret_path'] = '/tmp/encrypted_data_bag_secret'
default['web_application']['passwords']['data_bag'] = 'ahmyoga'

default['web_application']['database']['dbname'] = 'ahmyoga'
default['web_application']['database']['host'] = '127.0.0.1'
default['web_application']['database']['username'] = 'root'

default['web_application']['database']['app']['username'] = 'ahmyoga_db_user'

default['web_application']['database']['seed_file'] ='/tmp/create-tables.sql'


default['web_application']['wordpress']['version'] = 'latest'
default['web_application']['wordpress']['url'] = "https://wordpress.org/wordpress-#{node['web_application']['wordpress']['version']}.tar.gz"