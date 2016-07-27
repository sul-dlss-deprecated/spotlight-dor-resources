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

  spec.required_ruby_version = '>= 2.2.3' # parallel gem fails with 2.2.2

  spec.add_dependency 'faraday'
  spec.add_dependency 'solrizer'
  spec.add_dependency 'gdor-indexer', '>=0.5.0' # for new pub date methods
  # newer versions of harvestdor-indexer have performance improvements for collections
  spec.add_dependency 'harvestdor-indexer', '~> 2.4'
  spec.add_dependency 'rails'
  spec.add_dependency 'blacklight-spotlight', '~> 0.19'
  spec.add_dependency 'parallel'
  spec.add_dependency 'stanford-mods', '~> 2.1'
  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'solr_wrapper'
  spec.add_development_dependency 'engine_cart', '~> 0.8'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'exhibits_solr_conf', '~> 0.1'
  spec.add_development_dependency 'factory_girl_rails'
  spec.add_development_dependency 'rubocop', '~> 0.36'
  spec.add_development_dependency 'riiif', '~> 0.4.0' # optional dependency in production

  # FIXME: we shouldn't need explicit sitemap_generator dependency here as it should come with spotlight
  #   but travis fails without it (though tests run fine locally)
  # cbeer: "we're injecting the dependency into the host app.
  #        maybe we're just missing a `bundle install` somewhere to fix that up"
  spec.add_development_dependency 'sitemap_generator'
end
