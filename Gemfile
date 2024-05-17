source "https://rubygems.org"
ruby "3.2.2"

# Rails Framework
gem "rails", "~> 7.1.2"

# Database
gem "pg", "~> 1.1" # PostgreSQL adapter

# Web Server
gem "puma", ">= 5.0"

# Frontend
gem "sprockets-rails"
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "mini_racer"

# Authentication
gem "devise"
gem "devise-i18n" # Internationalization support for Devise

# Pagination
gem "kaminari"

# Search Functionality
gem "ransack"

# Internationalization
gem "rails-i18n"

# Caching
gem "bootsnap", require: false

# SEO Optimization
gem "meta-tags", require: "meta_tags" # Simplifies management of SEO tags

# Model and Schema Annotations
gem "annotate"

# File Uploads
gem "carrierwave"

# Debugging and Error Reporting
group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "better_errors" # Enhanced error page
  gem "binding_of_caller" # Access to context around errors
end

# Development Tools
group :development do
  gem "web-console"
  gem "rubocop" # Code style enforcement
  gem "rubocop-rails", require: false
  gem "pry-rails" # Enhanced debugging
  gem "letter_opener_web" # Email preview in development
  gem "bullet" # Detection of N+1 queries
  gem "pry-byebug" # Debugging tool combining pry and byebug
end

# Testing
group :test do
  gem "capybara" # Feature tests
  gem "selenium-webdriver" # Browser testing
  gem "rspec-rails" # Testing framework
  gem "factory_bot_rails" # Fixture replacement
  gem "shoulda-matchers" # Provides simple one-liner tests
end

# Data Seeding
gem "faker"

# Time Zone Data
gem "tzinfo-data", platforms: %i[windows jruby]

# CSS Framework
gem "tailwindcss-rails"

# Spotify API Wrapper
gem "rspotify"
