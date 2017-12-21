require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IMT
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.enable_dependency_loading = true
    config.autoload_paths += %W(#{config.root}/lib)
    config.load_defaults 5.1
    config.active_job.queue_adapter = :sidekiq
    I18n.default_locale = :en

    # Avoid deprecated message
    config.i18n.enforce_available_locales = false
    config.time_zone = 'America/Los_Angeles'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
