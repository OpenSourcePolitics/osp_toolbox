# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "active_storage_validations"
gem "bootsnap", ">= 1.4.4", require: false
gem "devise"
gem "dotenv-rails"
gem "image_processing", "~> 1.2"
gem "jbuilder", "~> 2.7"
gem "kaminari"
gem "pg"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.4"
gem "ransack"
gem "roo", "~> 2.8.0"
gem "roo-xls"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "webpacker", "~> 5.0"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rubocop", require: false
  gem "rubocop-rails"
end

group :development do
  gem "faker"
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "rails-erd"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :production do
  gem "aws-sdk-s3", require: false
  gem "sentry-rails"
  gem "sentry-ruby"
end
