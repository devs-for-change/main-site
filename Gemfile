source 'https://rubygems.org'
ruby '2.2.0'

# Default Gems
gem 'rails', '4.2.0'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 5.0'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'rails_12factor', group: :production
gem 'unicorn'

# App Gems
gem 'mongoid', '4.0.1'
gem 'devise'
gem 'slim'
gem 'nokogiri'
gem 'activeadmin', github: 'boie0025/activeadmin', branch: 'nb/rb-2.2-cleanup'
gem 'activeadmin-mongoid', github: 'devs-for-change/activeadmin-mongoid', branch: 'master'

gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem 'aws-sdk', '~> 1.3.4'
gem 'bootstrap-sass', '~> 3.3.1'
gem 'autoprefixer-rails'
gem 'simple_form'
gem 'mailgunner', '~> 1.3.0'
gem 'asset_sync'
gem "fog", "~>1.20", require: "fog/aws/storage"
gem 'multi_json', '1.10.1'

# Group Gems
group :doc do
  gem 'sdoc', '~> 0.4.0'
end

group :development do
  gem 'guard-rspec', require: false
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'mongoid-rspec'
  gem 'thin'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'simplecov'
  gem 'pry'
  gem 'rails-pry'
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'launchy'
end

gem "codeclimate-test-reporter", group: :test, require: nil

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
end
