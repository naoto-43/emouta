source "https://rubygems.org"
ruby "3.2.2"
gem "rails", "~> 7.1.2"

# データベース関連
gem "pg", "~> 1.1" # PostgreSQL

# Webサーバー
gem "puma", ">= 5.0"

# フロントエンド
gem "sprockets-rails"
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "mini_racer"

# 認証機能
gem "devise"
gem "devise-i18n" # Deviseの国際化サポート

# ページネーション
gem "kaminari"

# 検索機能
gem "ransack"

# 多言語対応
gem "rails-i18n"

# キャッシング
gem "bootsnap", require: false

# SEO最適化
gem "meta-tags", require: "meta_tags" # SEOタグの簡単管理

# モデルとテーブルスキーマの注釈
gem "annotate"

# ファイルアップロード
gem "carrierwave"

# 開発ツール
group :development do
  gem "web-console"
  gem "rubocop" # コードのスタイルガイド遵守をチェック
  gem "pry-rails" # より良いデバッグ体験
  gem "letter_opener_web" # 開発環境でのメールプレビュー
  gem "bullet" # N+1問題の識別
end

# デバッグとエラー報告
group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "better_errors" # エラー画面をより詳細に
  gem "binding_of_caller" # エラー発生時のコールスタックへのアクセス
end

# テスト関連
group :test do
  gem "capybara" # フィーチャーテスト
  gem "selenium-webdriver" # ブラウザテスト
  gem "rspec-rails" # テストフレームワーク
  gem "factory_bot_rails" # テストデータのファクトリ
  gem 'shoulda-matchers'
end

# データのシーディング
gem "faker"

# 時間帯データ
gem "tzinfo-data", platforms: %i[ windows jruby ]

# 追加のデバッグツール
gem "pry-byebug"

# CSSフレームワーク
gem "tailwindcss-rails"

# Spotify APIラッパー
gem 'rspotify'
