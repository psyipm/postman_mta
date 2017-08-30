ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../dummy/config/environment', __FILE__)

require 'bundler/setup'
require 'postman_mta'
require 'rspec/rails'
require 'webmock/rspec'

require 'support/application_routes'

PostmanMta.setup do |config|
  config.api_key = 'test_api_key'
  config.api_secret = 'test_api_secret'
  config.api_endpoint = 'http://example.com'
end

RSpec.configure do |config|
  config.include ApplicationRoutes, type: :controller

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
