source 'https://rubygems.org'
source 'https://rails-assets.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

# Use postgres as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails'
gem "slim-rails"
gem 'rails-assets-angular'
gem 'rails-assets-angular-route'
gem 'rails-assets-angular-animate'
gem 'rails-assets-angular-truncate-asset'
gem 'font-awesome-sass'

# Use thin instead of Webrick because Webrick is bad
gem 'thin'

# Allow private gems in travis
gh_oauth_token = '110e30514c8fe1ba44e8b73340b8a4a3e7ae4626'

group :development do
  gem "better_errors"
  # Use Smashing Boxer for deploys
  gem 'smashing_boxer',
    git: "https://#{gh_oauth_token}:x-oauth-basic@github.com/smashingboxes/smashing_boxer",
    branch: "master"
end

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# The twitter gem for use with the NGDWYL bot
gem 'twitter'

# For sending reminder tweets after some time has passed
gem 'delayed_job_active_record'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'factory_girl_rails'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

# Use debugger
# gem 'debugger', group: [:development, :test]
