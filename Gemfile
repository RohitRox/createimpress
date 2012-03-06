source 'http://rubygems.org'

gem 'rails', '3.1.3'

gem 'foreman'
gem 'rubyzip'

group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem "sqlite3-ruby", :require => "sqlite3"
  gem 'pry'
end

gem 'jquery-rails'

group :production do
  gem 'pg'
  gem 'thin'
  gem 'heroku'
end

group :test do
  gem 'turn', '~> 0.8.3', :require => false
end

