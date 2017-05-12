source 'https://rubygems.org'
ruby "2.3.1"

gem 'bundler', '>=1.11.2'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Rails gem of the Bootstrap based admin theme SB Admin 2.
gem 'bootstrap_sb_admin_base_v2'
#Better error page for Rack apps
gem "better_errors"
#Flexible authentication solution for Rails with Warden.
gem 'devise'
# Translations for devise
gem 'devise-i18n'
# A Ruby library that encodes QR Codes http://whomwah.github.com/rqrcode/
gem 'rqrcode'
gem 'rqrcode_png'
# faker gem
gem 'faker'
# Minimal authorization throug )) design and pure Ruby classes
gem 'pundit'
# Help ActiveRecord::Enum feature to work with I18n and simple_form
gem 'enum_help'
# jQuery-ui-rails
gem 'jquery-ui-rails'
# Easy file attachment management for ActiveRecord
gem 'paperclip', '~> 5.0.0'

gem 'foreman'



source 'https://rails-assets.org' do
  # alert messages
  gem 'rails-assets-notifyjs'
  # BootboxJS
  gem 'rails-assets-bootbox'
end


# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # Heroku dependencies
  # PostgreSQL
  gem 'pg'
  # rails_12factor
  gem 'rails_12factor'
end
