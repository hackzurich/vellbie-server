# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'bcrypt', '~> 3.1.7'
gem 'jbuilder', '~> 2.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.7'
gem 'redis', '~> 4.0'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'brakeman'
gem 'bundler-audit'
gem 'rack-cors', require: 'rack/cors'

gem 'react-rails'

gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'rubocop', require: false
gem 'solargraph', require: false

gem 'rswag', '~> 2.4'

# API

gem 'interactor-rails', '~> 2.2', '>= 2.2.1'
gem 'jsonapi-serializer', '~> 2.2'
gem 'kaminari', '~> 1.2', '>= 1.2.1'

gem 'pg_search', '~> 2.3', '>= 2.3.5'

gem 'rollbar'
gem 'rswag-api', '~> 2.4'
gem 'rswag-ui', '~> 2.4'
gem 'sidekiq', '~> 6.2', '>= 6.2.2'

gem 'pundit', '~> 2.1', '>= 2.1.1'

gem 'devise', '~> 4.8'
gem 'devise_invitable', '~> 2.0', '>= 2.0.5'
gem 'doorkeeper', '~> 5.5', '>= 5.5.2'
gem 'doorkeeper-jwt', '~> 0.4.0'
gem 'factory_bot_rails', '~> 6.2'
gem 'faker', '~> 2.18'
gem 'faraday'
gem 'rspec'

gem 'trestle', '~> 0.9.5'

group :development, :test do
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.2'
  gem 'rswag-specs', '~> 2.4'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
