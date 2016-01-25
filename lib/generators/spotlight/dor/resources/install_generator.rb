require 'rails/generators'

module Spotlight
  module Dor
    module Resources
      # :nodoc:
      class InstallGenerator < Rails::Generators::Base
        desc 'This generator mounts the Spotlight::Dor::Resources engine'

        def inject_spotlight_dor_resources_routes
          route "mount Spotlight::Dor::Resources::Engine, at: 'spotlight_dor_resources'"
        end
      end
    end
  end
end
