require_relative "boot"

require "rails/all"
require 'base64'
require 'json'

google_credentials = JSON.parse(Base64.decode64(ENV['GOOGLE_CREDENTIALS_BASE_64']))
ENV['GOOGLE_APPLICATION_CREDENTIALS'] = "/tmp/gcloud_key.json"

# Save it to a temporary file
File.open(ENV['GOOGLE_APPLICATION_CREDENTIALS'], 'w') do |file|
  file.write(JSON.generate(google_credentials))
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Seddit
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
