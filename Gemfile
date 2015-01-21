source 'https://rubygems.org'

# Specify your gem's dependencies in spotlight-dor-resources.gemspec
gemspec

gem 'gdor-indexer', github: 'sul-dlss/gdor-indexer', branch: 'refactor'
gem 'harvestdor-indexer', github: "sul-dlss/harvestdor-indexer", branch: "refactor"
gem "harvestdor", github: "sul-dlss/harvestdor", branch: "remove-oai"
gem "sir_trevor_rails", github: "sul-dlss/sir-trevor-rails"

# If we don't specify 2.11.0 we'll end up with sprockets 2.12.0 in the main 
# Gemfile.lock but since sass-rails gets generated (rails new) into the test app
# it'll want sprockets 2.11.0 and we'll have a conflict
gem 'sprockets', '2.11.0'

# If we don't specify 3.2.15 we'll end up with sass 3.3.2 in the main 
# Gemfile.lock but since sass-rails gets generated (rails new) into the test app
# it'll want sass 3.2.0 and we'll have a conflict
gem 'sass', '~> 3.2.0'

group :test do
  # Peg simplecov to < 0.8 until this is resolved:
  # https://github.com/colszowka/simplecov/issues/281
  gem 'simplecov', '~> 0.7.1', require: false
  gem 'coveralls', require: false
end

file = File.expand_path("Gemfile", ENV['ENGINE_CART_DESTINATION'] || ENV['RAILS_ROOT'] || File.expand_path("../spec/internal", __FILE__))
if File.exists?(file)
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