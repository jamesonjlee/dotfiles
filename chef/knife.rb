current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "jamesonjlee"
client_key               "#{current_dir}/jamesonjlee.pem"
validation_client_name   "jamesonjlee-validator"
validation_key           "#{current_dir}/jamesonjlee-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/jamesonjlee"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["~jameson/git/chef-repo/cookbooks"]
