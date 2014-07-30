require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Banners
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.autoload_paths += %W(#{config.root}/lib)
    config.action_controller.perform_caching = true


    config.after_initialize do
      dir =  Dir.new("app/controllers/test_controllers")
      controllers = dir.entries.delete_if {|x| x == ".." || x == "."}
      test_controllers = controllers.map do |controller|
        controller.sub!(".rb", "").camelcase
      end

      @controllers = {}

      ApplicationController.subclasses.each do |controller|
        if test_controllers.include?(controller.to_s)
          controller_name = controller.to_s.sub("Controller", "")
          @controllers[controller_name] = controller.action_methods.to_a
        end
      end

      Rails.cache.write("controllers", @controllers)
    end
  end
end
