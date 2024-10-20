require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module PopMenuProject
	class Application < Rails::Application
		config.load_defaults 8.0
		config.autoload_lib(ignore: %w[assets tasks])
		config.api_only = true

		config.generators do |g|
			g.test_framework :rspec,
											fixtures: true,
											view_specs: false,
											helper_specs: false,
											routing_specs: false,
											controller_specs: true,
											request_specs: false

			g.fixture_replacement :factory_bot, dir: "spec/factories"
		end
	end
end
