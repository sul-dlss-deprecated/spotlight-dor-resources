require 'spotlight/engine'
require 'spotlight/dor/resources'

module Spotlight::Dor::Resources
  # :nodoc:
  class Engine < ::Rails::Engine
    initializer 'spotlight.dor.initialize' do
      Spotlight::Engine.config.resource_providers << Spotlight::Resources::Searchworks
      Spotlight::Engine.config.resource_providers << Spotlight::Resources::Purl
      Spotlight::Dor::Resources::Engine.config.parallel_options = { in_threads: 1 }
      Spotlight::Dor::Resources::Engine.config.base_stacks_url = 'https://stacks.stanford.edu'
      Spotlight::Dor::Resources::Engine.config.stacks_file_url = "#{config.base_stacks_url}/file"
      Spotlight::Dor::Resources::Engine.config.stacks_iiif_url = "#{config.base_stacks_url}/image/iiif"
    end
  end
end
