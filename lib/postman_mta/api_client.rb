require 'httparty'

module PostmanMta
  class ApiClient
    include ::HTTParty
    base_uri PostmanMta.api_endpoint

    [:get, :post, :put, :patch, :delete].each do |type|
      define_method type do |url, options = {}|
        perform_request(type.to_s.upcase, url, options)
      end
    end

    private

    def perform_request(request_type, path, options = {})
      headers = PostmanMta::Utils::SignedRequest.new(
        request_method: request_type.upcase, path: path
      ).headers

      self.class.send(request_type.downcase, path, { headers: headers }.merge(options)).parsed_response
    end
  end
end
