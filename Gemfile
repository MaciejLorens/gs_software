source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.3.3'
gem 'rails', '~> 5.2.1'

# front-end
gem 'bootstrap', '~> 4.1.3'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'mini_racer'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# back-end
gem 'devise'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'rqrcode'

# support
gem 'bootsnap', '>= 1.1.0', require: false
gem 'capistrano-rails', group: :development
gem 'hirb'
gem 'puma', '~> 3.11'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
