# frozen_string_literal: true

source 'https://rubygems.org'

gem 'bootsnap', '~> 1.5', '>= 1.5.1', require: false
gem 'rails', '~> 6.1'
gem 'puma', '~> 4.3.6'
gem 'mysql2', '~> 0.5.3'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'rubocop-rails', '~> 2.8', '>= 2.8.1'
  gem 'rubocop-rspec', '~> 2.1'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1', '>= 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'database_cleaner', '~> 1.8', '>= 1.8.5'
  gem 'dotenv-rails'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'rspec-rails', '~> 3.8'
end

group :test do
  gem 'json_matchers', '~> 0.11.1'
  gem 'shoulda-matchers', '~> 4.4', '>= 4.4.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
