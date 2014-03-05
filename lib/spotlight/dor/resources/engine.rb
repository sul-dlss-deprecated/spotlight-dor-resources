require 'spotlight'
require 'spotlight/dor/resources'

module Spotlight::Dor::Resources
  class Engine < ::Rails::Engine

    initializer "spotlight.dor.initialize" do
      Spotlight::Engine.config.resource_providers << Spotlight::Resource::Searchworks
      Spotlight::Engine.config.resource_providers << Spotlight::Resource::Purl
      Spotlight::Dor::Resources.indexer = Spotlight::Dor::Indexer.new
    end
  end
end
