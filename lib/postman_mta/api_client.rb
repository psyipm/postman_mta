module PostmanMta
  class ApiClient
    [:get, :post, :put, :patch, :delete].each do |type|
      define_method type do |url, options = {}|
        perform_request(type.to_s.upcase, url, options)
      end
    end

    private

    def perform_request(request_type, path, options = {})
      api_request = ::PostmanMta::ApiRequest.new(request_type, path, options)
      response = api_request.perform

      { json: response.parsed_response, status: response.code }
    end
  end
end
