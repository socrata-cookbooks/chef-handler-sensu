# SensuCleaner

A Chef handler to cleanup stale Sensu checks by cross-checking the files in
your checks directory with the resources from the Chef run.

## Usage

By including the default recipe, this handler will be set up as indicated below.

The Chef docs [1] lay out a pretty simple way to use handlers by leveraging the
chef\_handler resource. Just ship the chef-handler-sensu-cleaner.rb file to
your handlers location and declare a new handler:

```ruby
cookbook_file "#{node[:chef_handler][:handler_path]}/chef-handler-sensu.rb" do
  source 'chef-handler-sensu.rb'
  mode 00600
end

chef_handler 'SensuCleaner' do
  source "#{node[:chef_handler][:handler_path]}/chef-handler-sensu.rb"
  action :enable
end
```

Obviously make sure to copy the ruby file into the `/files/default` directory
of your cookbook as well. Alternatively, install it as a Rubygem and source it that way:

[1] http://docs.opscode.com/essentials_handlers_install.html

## License

Apache License, Version 2.0

## Author

Socrata <sysadmin@socrata.com>
Simple Finance <ops@simple.com>

n
