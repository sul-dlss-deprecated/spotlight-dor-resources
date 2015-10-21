source 'https://rubygems.org'

# Specify your gem's dependencies in spotlight-dor-resources.gemspec
gemspec

gem 'gdor-indexer', github: 'sul-dlss/gdor-indexer'
gem 'harvestdor-indexer', github: "sul-dlss/harvestdor-indexer"
gem "harvestdor", github: "sul-dlss/harvestdor"
gem 'blacklight-spotlight', github: 'sul-dlss/spotlight'

group :test do
  # Peg simplecov to < 0.8 until this is resolved:
  # https://github.com/colszowka/simplecov/issues/281
  gem 'simplecov', '~> 0.10', require: false
  gem 'coveralls', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
end

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
