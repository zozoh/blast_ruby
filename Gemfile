source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# Push Notification
gem 'apns'
gem 'gcm'

# Resque
gem 'resque', '1.25.1', :require => "resque/server"
gem 'resque_mailer', '2.2.4'
gem 'resque-web', require: 'resque_web'

#uploader
gem "carrierwave", "0.9.0"
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'

# Settings
gem 'settingslogic'

#api
gem 'grape'
gem 'grape-entity'

# Use mongodb
gem 'mongoid', git: 'git://github.com/mongoid/mongoid.git'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

gem "therubyracer"
gem "less-rails"
gem 'twitter-bootstrap-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'simple_form'

gem 'googl'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'thin'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'spork'

  #Debugger
  gem 'pry'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  # gem 'launchy'
  # gem 'rb-fsevent'
  # gem 'growl'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
