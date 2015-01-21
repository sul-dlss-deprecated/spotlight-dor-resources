ENV["RAILS_ENV"] ||= 'test'

require 'factory_girl'
require 'database_cleaner'
require 'devise'
require 'engine_cart'
require 'vcr'
EngineCart.load_application!

require 'rspec/rails'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
Capybara.default_wait_time = 5

if ENV["COVERAGE"] or ENV["CI"]
  require 'simplecov'
  require 'coveralls' if ENV["CI"]

  SimpleCov.formatter = Coveralls::SimpleCov::Formatter if ENV["CI"]
  SimpleCov.start do
    add_filter "/spec/"
  end
end

require 'spotlight'


Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

FactoryGirl.definition_file_paths = [File.expand_path("../factories", __FILE__)]
FactoryGirl.find_definitions

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before :each do
    if Capybara.current_driver == :rack_test
      DatabaseCleaner.strategy = :transaction
    else
      DatabaseCleaner.strategy = :truncation
    end
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.include Devise::TestHelpers, type: :controller
  config.include Devise::TestHelpers, type: :view
  config.include Warden::Test::Helpers, type: :feature
  config.after(:each, type: :feature) { Warden.test_reset! }
  config.include Capybara::DSL
end