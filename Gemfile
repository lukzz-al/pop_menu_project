source "https://rubygems.org"

# Core
gem "rails", "~> 8.0.1"
gem "puma", ">= 5.0"

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "bootsnap", require: false
gem "kamal", ">= 2.0.0.rc2", require: false
gem "thruster", require: false

# Storage
gem "sqlite3", ">= 2.1"

# Background Processing
gem 'sidekiq', '~> 7.3'

# Tools
gem "pagy", "~> 9.3"
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
	gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
	gem "pry-byebug", "~> 3.10"
	gem "brakeman", require: false
	gem "rubocop-rails-omakase", require: false
end

group :test do
	gem "rspec-rails", "~> 7.1.0"
	gem "factory_bot_rails", "~> 6.4.4"
	gem "ffaker", "~> 2.23.0"
	gem "database_cleaner-active_record", "~> 2.2.0"
	gem "shoulda-matchers", "~> 6.4"
end
