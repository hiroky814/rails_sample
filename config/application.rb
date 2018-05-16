require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FLEETAC
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # to auto load lib/ directory
    config.autoload_paths += %W[#{config.root}/lib]
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local 
    
    config.assets.paths << config.root.join('node_modules')
  end
end
