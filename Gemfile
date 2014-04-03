source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

gem 'rails-api'
gem 'active_model_serializers'
# Use postgresql as the database for Active Record
gem 'pg'


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "ransack"
gem "kaminari"
gem "active_decorator"
gem "devise"
gem "devise-i18n"
gem 'devise-token_authenticatable'
gem "cancan"
gem 'acts-as-taggable-on'
gem 'acts_as_commentable'
gem 'rack-cors', :require => 'rack/cors'
gem 'kakurenbo'
gem "rails_12factor", group: :production
group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "capybara"
  gem "pry-rails"
  gem "pry-doc"
  gem "pry-stack_explorer"
  gem "pry-byebug"
  gem "spring"
  gem "spring-commands-rspec"
  gem "poltergeist"
end

group :development do
  gem "parallel_tests"
  gem "better_errors"
  gem "binding_of_caller"
  gem "letter_opener"
  gem "annotate"
end

group :test do
  gem "database_rewinder"
  gem "timecop"
  gem "launchy"
  gem "webmock", require: "webmock/rspec"
end
