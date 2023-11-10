source "https://rubygems.org"

ruby "2.7.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.1"
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Jsonapi
gem 'jsonapi-serializer'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"
gem "jwt"
gem "faker"
gem "tty-spinner"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 6.0.0'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'rspec-json_expectations'
  gem 'json_matchers'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

