# See http://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "jyennaco"
client_key               "#{current_dir}/jyennaco.pem"
validation_client_name   "ahmyoga-validator"
validation_key           "#{current_dir}/ahmyoga-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/ahmyoga"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
cookbook_copyright       "Joe Yennaco"
cookbook_email           "joe@joeyennaco.com"
cookbook_license         "apachev2"
