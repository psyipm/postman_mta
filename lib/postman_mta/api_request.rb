require 'httparty'

module PostmanMta
  class ApiRequest
    include ::HTTParty
    base_uri PostmanMta.api_endpoint

    attr_reader :request_type, :path, :options, :callback

    def initialize(request_type, path, options = {})
      @callback = PostmanMta.before_request_hook

      @request_type = request_type
      @path = path
      @options = options
    end

    def perform
      self.class.send(request_type.downcase, path, request_options)
    end

    def full_path
      @full_path ||= PostmanMta.api_endpoint + path
    end

    def uri
      @uri ||= URI(full_path)
    end

    private

    def request_options
      { headers: auth_headers, format: :json }.merge(merge_with_custom_options)
    end

    def auth_headers
      PostmanMta::Utils::SignedRequest.new(request_method: request_type.upcase, path: uri.request_uri).headers
    end

    def merge_with_custom_options
      return options unless callback

      custom_options = callback.call
      return options unless custom_options.is_a?(Hash)

      options[:body] = (options[:body] || {}).merge(custom_options)

      options
    end
  end
end
