source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.9'

gem 'rails', '~> 6.0.4', '>= 6.0.4.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'responders'
gem 'devise'
gem 'jwt'
gem 'rack-cors'
#gem 'activestorage'
#gem 'active_storage_db'
#gem "image_processing", ">= 1.2"
gem 'active_model_serializers'
#gem 'active_storage_base64'



# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
#gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'database_cleaner'

end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


group :test do
  gem "shoulda-matchers", "~> 4.5"
  gem "simplecov", "~> 0.21.2", require: false
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
