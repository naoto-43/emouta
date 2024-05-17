source 'https://rubygems.org'
ruby '3.2.2'

# Rails Framework
gem 'rails', '~> 7.1.2'

# Database
gem 'pg', '~> 1.1' # PostgreSQL adapter

# Web Server
gem 'puma', '>= 5.0'

# Frontend
gem 'cssbundling-rails'
gem 'jsbundling-rails'
gem 'mini_racer'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

# Authentication
gem 'devise'
gem 'devise-i18n' # Internationalization support for Devise

# Pagination
gem 'kaminari'

# Search Functionality
gem 'ransack'

# Internationalization
gem 'rails-i18n'

# Caching
gem 'bootsnap', require: false

# SEO Optimization
gem 'meta-tags', require: 'meta_tags' # Simplifies management of SEO tags

# Model and Schema Annotations
gem 'annotate'

# File Uploads
gem 'carrierwave'

# Debugging and Error Reporting
group :development, :test do
  gem 'better_errors' # Enhanced error page
  gem 'binding_of_caller' # Access to context around errors
  gem 'debug', platforms: %i[mri windows]
end

# Development Tools
group :development do
  gem 'bullet' # Detection of N+1 queries
  gem 'letter_opener_web' # Email preview in development
  gem 'pry-byebug' # Debugging tool combining pry and byebug
  gem 'pry-rails' # Enhanced debugging
  gem 'rubocop' # Code style enforcement
  gem 'rubocop-rails', require: false
  gem 'web-console'
end

# Testing
group :test do
  gem 'capybara' # Feature tests
  gem 'factory_bot_rails' # Fixture replacement
  gem 'rspec-rails' # Testing framework
  gem 'selenium-webdriver' # Browser testing
  gem 'shoulda-matchers' # Provides simple one-liner tests
end

# Data Seeding
gem 'faker'

# Time Zone Data
gem 'tzinfo-data', platforms: %i[windows jruby]

# CSS Framework
gem 'tailwindcss-rails'

# Spotify API Wrapper
gem 'rspotify'
