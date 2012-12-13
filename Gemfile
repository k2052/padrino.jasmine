source :rubygems


# Server requirements
gem 'thin', '~> 1.5.0'

# Project requirements
gem 'rake', '~> 10.0.2'
gem 'sinatra-flash', :require => 'sinatra/flash'

# Component requirements
gem 'slim',         '~> 1.3.4'
gem 'mongo_mapper', '~> 0.12.0', :require => 'mongo_mapper'
gem 'bson_ext',     '~> 1.8.0', :require => 'mongo'     

# Assets
gem 'compass',              '~> 0.12.2'
gem 'sprockets',            '~> 2.2.1'
gem 'coffee-script',        '~> 2.2.0'
gem 'uglifier',             '~> 1.3.0'
gem 'padrino-sprockets',    '~> 0.0.1', :git => 'git://github.com/bookworm/padrino-sprockets.git'     
gem 'padrino-assethelpers', '~> 0.1.0', :git => 'git://github.com/bookworm/padrino-assethelpers.git'

group :development, :test do
  gem 'guard-jasmine'
end

# Test requirements
group :test do
  gem 'rspec'
  gem 'rack-test'
end

# Padrino Stable Gem
gem 'padrino', '0.10.7'
