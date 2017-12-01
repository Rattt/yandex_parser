require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Www
  class Application < Rails::Application
    config.load_defaults 5.1

    config.eager_load_paths += Dir["#{config.root}/app/commands/"]
    config.eager_load_paths += Dir["#{config.root}/app/services/"]



    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.log_tags  = [:subdomain, :uuid]
    config.logger    = ActiveSupport::TaggedLogging.new(logger)

    config.generators do |g|
      g.helper false
      g.javascripts false
      g.template_engine :haml
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: true,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: true,
                       request_specs: true
    end
  end
end
