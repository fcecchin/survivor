source 'https://rubygems.org'
ruby '2.1.1'

gem 'rails', '4.0.6'
gem 'therubyracer', '~> 0.12.1'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'haml'
gem 'draper'
gem 'rails_admin'
gem 'i18n', github: 'svenfuchs/i18n'
gem 'figaro'

# added by fcc
gem 'simple_form'	# https://github.com/plataformatec/simple_form
gem "cocoon"		# https://github.com/nathanvda/cocoon

# authentication
gem 'devise'
gem 'omniauth-facebook'

gem 'puma'
#gem 'mysql2', group: [:production, :test]

group :assets do
	gem 'sass-rails'
	gem 'uglifier'
	gem 'coffee-rails'
end

group :production do 
	gem 'pg'
	gem 'rails_12factor'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.4.2'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'codeclimate-test-reporter', require: nil
  gem 'sqlite3'
end
