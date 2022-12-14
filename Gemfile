source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby "3.1.2"
gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "kredis"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "sassc-rails"
gem "image_processing", "~> 1.2"
gem "mini_racer"
gem "bootstrap", "~> 5.1.3"

gem "omniauth"
gem "omniauth-rails_csrf_protection"
gem "omniauth-apple"
gem "omniauth-google-oauth2"
gem "omniauth-microsoft-office365"
gem "omniauth-identity2"

gem "sidekiq"
gem "daemons"
gem "rujitsu"
gem "redcarpet"
gem "cancancan"
gem "object-factory", require: "object_factory"
gem "aws-sdk-s3"
gem "lograge"
gem "dalli"
gem "kaminari"
gem "httparty"
gem "color_math"
gem "acts_as_list"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec"
  gem "rspec-rails"
  gem "mocha", require: false
  gem "timecop"
  gem "parallel_tests"
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "web-console"
  gem "rack-mini-profiler"
  gem "rufo"
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
