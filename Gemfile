source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'dry-validation'
gem 'jbuilder', '~> 2.5'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.6', '>= 5.1.6.1'
gem 'reform'
gem 'trailblazer'
gem 'trailblazer-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'graphql'
gem 'rubocop-rspec'
gem 'json_web_token'

group :development, :test do
  gem 'factory_bot_rails', '~> 4.11', '>= 4.11.1'
  gem 'database_cleaner', '~> 1.7'
  gem 'pry'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'graphiql-rails', group: :development
