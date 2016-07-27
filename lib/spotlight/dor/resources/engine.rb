require 'spotlight/engine'
require 'spotlight/dor/resources'

module Spotlight::Dor::Resources
  # :nodoc:
  class Engine < ::Rails::Engine
    config.parallel_options = { in_threads: 1 }
    config.base_stacks_url = 'https://stacks.stanford.edu'
    config.stacks_file_url = "#{config.base_stacks_url}/file"
    config.stacks_iiif_url = "#{config.base_stacks_url}/image/iiif"
    config.geonames_username = nil

    initializer 'spotlight.resources.dor_harvester.initialize' do
      Spotlight::Engine.config.external_resources_partials ||= []
      Spotlight::Engine.config.external_resources_partials << 'spotlight/resources/dor_harvester/form'
    end
  end
end
