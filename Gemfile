source ENV['GEM_SOURCE'] || 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 3.3']

group :development, :unit_tests do
  # rspec must be v2 for ruby 1.8.7
  if RUBY_VERSION >= '1.8.7' and RUBY_VERSION < '1.9'
    gem 'rspec', '~> 2.0'
  end
  
  gem 'metadata-json-lint'
  gem 'puppetlabs_spec_helper', '>= 1.0.0'
  gem 'puppet-lint', '>= 1.0.0'
  gem 'rspec-puppet'
end

group :system_tests do
  gem 'beaker'
  gem 'beaker-rspec'
  gem "beaker-puppet_install_helper"
end

gem 'puppet', puppetversion
gem 'facter', '>= 1.7.0'
