source "https://rubygems.org"

ruby "3.2.2"

# Rails
gem "rails", "~> 7.1.2"

# Database
gem "pg", "~> 1.1"

# Web server
gem "puma", ">= 5.0"

# Frontend
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "mini_racer"

# Background Jobs
# gem "sidekiq" # Uncomment if using Sidekiq for background jobs

# Caching
gem "bootsnap", require: false

# Authentication
gem "devise"

# Pagination
gem "kaminari"

# Search
gem "ransack"

# Internationalization
gem "rails-i18n"
gem 'devise-i18n'

# Debugging and error reporting
group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "better_errors"
  gem "binding_of_caller"
end

group :development do
  gem "web-console"
  # gem "spring" # Uncomment if using Spring for faster development
  gem "rubocop"
  gem "pry-rails"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "rspec-rails"
  gem "factory_bot_rails"
end

# Data seeding
gem "faker"

# Timezone data
gem "tzinfo-data", platforms: %i[ windows jruby ]

# SEOの最適化
gem "meta-tags", require: "meta_tags"

# モデルとテーブルスキーマの注釈
gem "annotate"

# 開発環境でのメールプレビュー
group :development do
  gem "letter_opener_web"
end

# N+1問題の識別
group :development do
  gem "bullet"
end

# Font Awesomeアイコン
gem "font-awesome-sass"
gem "cssbundling-rails"

gem 'pry-byebug'

gem "tailwindcss-rails"

gem 'rspotify'

gem 'carrierwave'
