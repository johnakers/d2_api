# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.1.1'

# server
gem 'rails', '~> 7.0.3'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'rack-cors'

# database
gem 'pg', '~> 1.1'

# other
gem 'jsonapi-serializer'

# seeds
gem 'faker'

# jobs
# gem 'sidekiq'

group :development, :test do
  # debugging
  gem 'pry-byebug'

  # testing
  gem 'factory_bot'

  # output
  gem 'colorize'

  # rubocop
  gem 'rubocop',       require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  # reload
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  # test coverage
  gem 'simplecov', require: false

  # testing
  gem 'rspec-rails', '~> 5.0.0'
end

# ??
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
