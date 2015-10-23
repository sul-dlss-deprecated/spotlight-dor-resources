[![Build Status](https://travis-ci.org/sul-dlss/spotlight-dor-resources.png?branch=master)](https://travis-ci.org/sul-dlss/spotlight-dor-resources) | [![Coverage Status](https://coveralls.io/repos/sul-dlss/spotlight-dor-resources/badge.png?branch=master)](https://coveralls.io/r/sul-dlss/spotlight-dor-resources) | [![Gem Version](https://badge.fury.io/rb/spotlight-dor-resources.png)](http://badge.fury.io/rb/spotlight-dor-resources)

# Spotlight::Dor::Resources

 Harvest Stanford DOR resources into a Spotlight exhibit.

## Installation

Add this line to your application's Gemfile:

    gem 'spotlight-dor-resources'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spotlight-dor-resources

## Usage

Within a Spotlight application with `spotlight-dor-resources` installed, you could index a set of records the ["gdor-indexer"](https://github.com/sul-dlss/gdor-indexer) way.

Note that Spotlight:

* is a Rails engine and needs to be used in the context of a Rails application. We use [engine_cart](https://github.com/cbeer/engine_cart) to create an internal test application at spec/internal.
* uses Solr as part of its integration tests. We use [jettywrapper](https://github.com/projecthydra/jettywrapper) to manage the Solr instance used for development and test.

Our `$ rake ci` task utilizes Solr and the testing rails app, with Spotlight installed, automatically.

For access to a Rails console with the gem loaded up for testing purposes, you can use an engine-cart generated Spotlight app.

### First time only configuration for local testing

    $ bundle
    $ bundle exec rake:ci

This will download a test jetty instance (to run Solr), generate a testing app at ```spec/internal``` and run the tests.

### Indexing with the generated test app

    $ cd spec/internal

    $ bundle exec rails console

```ruby
purl=Spotlight::Resources::Purl.new({:url=>'https://purl.stanford.edu/cx709ty7769'})
puts purl.to_solr.first # the solr document as a hash
public_xml=purl.resource.public_xml # nokogiri doc with all public XML
mods=purl.resource.mods # nokogiri doc with just the MODs
smods_rec=purl.resource.smods_rec # a Stanford::Mods::Record Object (which inherits from the MODS gem)

purl.resource.indexer.config.solr.url # the configured solr server (should be localhost in development)
purl.save # save and index to solr
purl.reindex # reindex once saved the first time
```

## Contributing

1. Fork it ( http://github.com/sul-dlss/spotlight-dor-resources/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
