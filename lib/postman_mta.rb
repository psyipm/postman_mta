require 'postman_mta/version'
require 'postman_mta/engine'

module PostmanMta
  module Utils
    autoload :Signature, 'postman_mta/utils/signature'
    autoload :SignedRequest, 'postman_mta/utils/signed_request'
  end

  autoload :ApiClient, 'postman_mta/api_client'

  module Models
    autoload :ApplicationModel, 'postman_mta/models/application_model'
    autoload :Message, 'postman_mta/models/message'
  end

  mattr_accessor :api_key
  mattr_accessor :api_secret
  mattr_accessor :api_endpoint

  def self.setup
    yield self
  end
end
