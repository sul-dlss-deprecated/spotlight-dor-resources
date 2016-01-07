begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

ZIP_URL = 'https://github.com/projectblacklight/blacklight-jetty/archive/v4.10.4.zip'

Bundler::GemHelper.install_tasks

task default: [:ci, :rubocop]

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

require 'jettywrapper'
require 'engine_cart/rake_task'
require 'exhibits_solr_conf'
desc 'Run tests in generated test Rails app with generated Solr instance running'
task ci: ['engine_cart:generate', 'jetty:clean', 'exhibits:configure_solr'] do
  ENV['environment'] = 'test'
  ENV['TEST_JETTY_PORT'] = '8983'
  jetty_params = Jettywrapper.load_config
  jetty_params[:startup_wait] = 60

  Jettywrapper.wrap(jetty_params) do
    # run the tests
    Rake::Task['spec'].invoke
  end
end

require 'rdoc/task'
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Spotlight::Dor::Resources'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
