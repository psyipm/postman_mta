module PostmanMta
  class ApiClient
    attr_reader :response_body, :response_status

    [:get, :post, :put, :patch, :delete].each do |type|
      define_method type do |url, options = {}|
        perform_request(type.to_s.upcase, url, options)
      end
    end

    private

    def perform_request(request_type, path, options = {})
      api_request = ::PostmanMta::ApiRequest.new(request_type, path, options)
      response = api_request.perform

      @response_body = response.parsed_response
      @response_status = response.code

      { json: response_body, status: @response_status }
    end
  end
end
