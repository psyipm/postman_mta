require 'postman_mta/version'
require 'postman_mta/engine'

module PostmanMta
  module Utils
    autoload :Signature, 'postman_mta/utils/signature'
    autoload :SignedRequest, 'postman_mta/utils/signed_request'
  end

  autoload :ApiClient, 'postman_mta/api_client'
  autoload :ApiRequest, 'postman_mta/api_request'

  mattr_accessor :api_key
  mattr_accessor :api_secret
  mattr_accessor :api_endpoint

  # This block will be executed before request, and return value will be merged to params hash
  mattr_accessor :before_request_hook

  def self.setup
    yield self
  end
end
