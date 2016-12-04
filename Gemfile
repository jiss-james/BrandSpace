source 'http://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'autoprefixer-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'haml-rails', '~> 0.9'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'wdm', '>= 0.1.0' if Gem.win_platform?

gem 'figaro'

gem 'sidekiq'
gem 'annotate'

gem 'bootstrap', '~> 4.0.0.alpha4'
source 'http://insecure.rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end

gem 'font-awesome-sass', '~> 4.6.2'
gem 'kaminari'

gem 'devise'
gem 'omniauth-facebook'
gem 'cancancan', '~> 1.10'

gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'ransack',             github: 'activerecord-hackery/ransack'
gem 'draper',              '> 3.x'
gem 'activeadmin', github: 'activeadmin'
gem 'date_validator'
gem 'activeadmin_addons'
gem 'best_in_place', github: 'bernat/best_in_place'

gem 'inky-rb', require: 'inky'
gem 'premailer-rails'
gem 'high_voltage', '~> 3.0.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'rack-livereload'

  gem 'xray-rails'

  gem 'rubocop', require: false
  gem 'brakeman', :require => false

  gem 'letter_opener'
end

gem 'raygun4ruby'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]