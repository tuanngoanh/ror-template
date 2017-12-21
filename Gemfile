source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# Bootsnap is a library that plugs into Ruby, with optional support for ActiveSupport and YAML, 
# to optimize and cache expensive computations.
gem 'bootsnap', require: false
# Backgroud Worker
gem 'sidekiq', '~> 5.0', '>= 5.0.4'
# Make Form simple
gem 'simple_form', '~> 3.5'
# Init for Font awesome
gem 'font-awesome-sass'
# Replace IRB and beutiful color
gem 'pry-rails'
gem 'awesome_print'
# Angular JS
gem 'angularjs-rails', '~> 1.6', '>= 1.6.2'
# jQuery
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
# jQuery UI
gem 'jquery-ui-rails'
# Authentication
gem 'devise', '~> 4.3'
# Pagination
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
# Internationalization (i18n) for js
gem 'i18n-js'
# Config CORS for Angular JS
gem 'rack-cors'
# Friendly Id
gem 'friendly_id', '~> 5.2.0'
# jquery Data tables with rails.
gem 'jquery-datatables-rails', '~> 3.4.0'
# Notification (flash) javascript
gem 'toastr-rails'
# Mutiple STI
gem 'active_record-acts_as'
# CK Editor
gem 'ckeditor', github: 'galetahub/ckeditor'
# Breadcrumbs
gem 'breadcrumbs_on_rails'
# ElasticSearch via searckick
# Before using, please review at https://www.elastic.co/products/elasticsearch
gem 'searchkick'
# Use to_b function (object to bool)
gem 'wannabe_bool'
# Draper adds an object-oriented layer of presentation logic to your Rails apps.
gem 'draper', '~> 3.0.1'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  #N+1 query check
  gem 'bullet'
  #Chart Model
  gem 'rails-erd'
  gem 'erd'
  gem 'htmlbeautifier'
  # Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.
  gem 'annotate', '~> 2.7', '>= 2.7.2', require: false
  # Rails logger on rails pannel
  gem 'meta_request'
  # Rspec Unit test
  gem 'rspec-rails', '~> 3.7'
  # Rspec report format as junit to support Jenkins
  gem 'rspec_junit_formatter'
  # Code coverage
  gem 'simplecov'
  gem 'simplecov-rcov'
  # Mock test data
  gem 'faker'
  gem 'factory_bot'
  gem 'factory_bot_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
