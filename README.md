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

Within a Spotlight application with `spotlight-dor-resources` installed, you could index a set of records the ["harvestdor"](https://github.com/sul-dlss/harvestdor) or ["harvestdor-indexer"](https://github.com/sul-dlss/harvestdor-indexer) way, or from the rails console using:

For access to a Rails console with the gem loaded up for testing purposes , you can use the engine-cart generated app:

   $ cd spec/internal
   $ bundle exec rails console

```ruby
resource=Spotlight::Resources::Purl.new({:url=>'https://purl.stanford.edu/cx709ty7769'})
puts resource.to_solr.first
```

## Contributing

1. Fork it ( http://github.com/sul-dlss/spotlight-dor-resources/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
