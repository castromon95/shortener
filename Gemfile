source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundler version specified for control
gem 'bundler', '~> 2.0', '>= 2.0.2'
# Rake version specified for control
gem 'rake', '~> 12.3', '>= 12.3.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2', '>= 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1', '>= 1.1.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.9', '>= 2.9.1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.4', '>= 1.4.4', require: false
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 1.0', '>= 1.0.3', require: 'rack/cors'
# Http calls
gem 'httparty', '~> 0.21.0'
# Job runner
gem 'sidekiq', '~> 6.0.2'
# Fake data generator
gem 'faker', '~> 2.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Testing framework
  gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
  # Integration of factory bot and rails. Factory framework.
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Pry - Better console interface
  gem 'pry', '~> 0.12.2'
  gem 'pry-rails', '~> 0.3.9'
end

group :test do
  # DB cleaner for tests
  gem 'database_cleaner', '~> 1.7'
  # One-liner common tests
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  # Controller testing
  gem 'rails-controller-testing', '~> 0.0.3'
end