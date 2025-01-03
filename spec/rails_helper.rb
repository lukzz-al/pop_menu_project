ENV['RAILS_ENV'] ||= 'test'

require 'spec_helper'
require_relative '../config/environment'

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

begin
	ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
	abort e.to_s.strip
end

RSpec.configure do |config|
	config.use_transactional_fixtures = true
	config.infer_spec_type_from_file_location!
	config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
	config.integrate do |with|
			with.test_framework :rspec
			with.library :rails
	end
end
