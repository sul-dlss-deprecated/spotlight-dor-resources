source 'https://rubygems.org'

# Specify your gem's dependencies in spotlight-dor-resources.gemspec
gemspec

# sul-dlss gems: get latest versions from master, rather than released gems
gem 'blacklight-spotlight', github: 'sul-dlss/spotlight'

group :test do
  gem 'simplecov', '~> 0.10', require: false
  gem 'coveralls', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'pry', require: false
  gem 'pry-byebug', require: false
end

# the below comes from engine_cart, a gem used to test this Rails engine gem in the context of a Rails app
file = File.expand_path("Gemfile", ENV['ENGINE_CART_DESTINATION'] || ENV['RAILS_ROOT'] || File.expand_path("../spec/internal", __FILE__))
if File.exist?(file)
  puts "Loading #{file} ..." if $DEBUG # `ruby -d` or `bundle -v`
  instance_eval File.read(file)
else
  gem 'rails', ENV['RAILS_VERSION']

  # explicitly include sass-rails to get compatible sprocket dependencies
  if ENV['RAILS_VERSION'].nil? || ENV['RAILS_VERSION'] =~ /^4.2/
    gem 'coffee-rails', '~> 4.1.0'
    gem 'sass-rails', '~> 5.0'
    gem 'responders', "~> 2.0"
  else
    gem 'sass-rails', "< 5.0"
    gem 'coffee-rails', "~> 4.0.0"
  end
end
