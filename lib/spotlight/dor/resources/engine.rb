require 'spotlight/engine'
require 'spotlight/dor/resources'

module Spotlight::Dor::Resources
  class Engine < ::Rails::Engine

    initializer "spotlight.dor.initialize" do
      Spotlight::Engine.config.resource_providers << Spotlight::Resources::Searchworks
      Spotlight::Engine.config.resource_providers << Spotlight::Resources::Purl
      Spotlight::Dor::Resources::Engine.config.parallel_options = { in_threads: 1 }
    end
  end
end
