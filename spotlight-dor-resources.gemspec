# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spotlight/dor/resources/version'

Gem::Specification.new do |spec|
  spec.name          = 'spotlight-dor-resources'
  spec.version       = Spotlight::Dor::Resources::VERSION
  spec.authors       = ['Chris Beer']
  spec.email         = ['cabeer@stanford.edu']
  spec.summary       = 'Spotlight resource indexer for DOR resources.'
  spec.homepage      = 'https://github.com/sul-dlss/spotlight-dor-resources'
  spec.license       = 'Apache 2'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'solrizer'
  spec.add_dependency 'gdor-indexer'
  spec.add_dependency 'harvestdor-indexer', '>= 2.2.0' # 2.2.0 introduced enumerable collections
  spec.add_dependency 'rails'
  spec.add_dependency 'blacklight-spotlight', '~> 0.6'
  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'poltergeist', '>= 1.5.0'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'jettywrapper'
  spec.add_development_dependency 'engine_cart', '~> 0.3'
  spec.add_development_dependency 'factory_girl'
  spec.add_development_dependency 'database_cleaner'
end
