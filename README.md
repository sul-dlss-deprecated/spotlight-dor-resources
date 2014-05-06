# Spotlight::Dor::Resources

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'spotlight-dor-resources'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spotlight-dor-resources

## Usage

Within a Spotlight application with `spotlight-dor-resources` installed, you could index a set of records the ["harvestdor"](https://github.com/sul-dlss/harvestdor) or ["harvestdor-indexer"](https://github.com/sul-dlss/harvestdor-indexer) way, or from the rails console using:

```ruby
indexer = Spotlight::Dor::Indexer.new
indexer.instance_variable_set(:@solr_client, Blacklight.solr)
indexer.config[:default_set] = 'is_member_of_qb438pg7646'
indexer.send(:harvestdor_client).config[:default_set] = 'is_member_of_qb438pg7646'
indexer.harvest_and_index
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/spotlight-dor-resources/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
