require 'spotlight/engine'
require 'spotlight/dor/resources'

module Spotlight::Dor::Resources
  class Engine < ::Rails::Engine

    initializer "spotlight.dor.initialize" do
      Spotlight::Engine.config.resource_providers << Spotlight::Resources::Searchworks
      Spotlight::Engine.config.resource_providers << Spotlight::Resources::Purl
      Spotlight::Dor::Resources.indexer = Spotlight::Dor::Indexer.new
    end
  end
end
