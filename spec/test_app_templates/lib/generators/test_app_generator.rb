require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root "../../spec/test_app_templates"

  def add_gems
    gem 'blacklight', '~> 5.1'
    gem "blacklight-spotlight", github: 'sul-dlss/spotlight'
    Bundler.with_clean_env do
      run "bundle install"
    end
  end

  def run_blacklight_generator
    say_status("warning", "GENERATING BL", :yellow)
    generate 'blacklight:install', '--devise --jettywrapper'
  end

  def run_spotlight_migrations
    rake "spotlight:install:migrations"
    rake "db:migrate"
  end

  def add_spotlight_routes_and_assets
    # spotlight will provide its own catalog controller.. remove blacklight's to
    # avoid getting prompted about file conflicts
    remove_file "app/controllers/catalog_controller.rb"

    generate 'spotlight:install'
  end

  def add_catalog_controller
    copy_file "catalog_controller.rb", "app/controllers/catalog_controller.rb", force: true
  end

  def configure_gdor
    copy_file "gdor.yml", "config/gdor.yml", force: true
  end

end
