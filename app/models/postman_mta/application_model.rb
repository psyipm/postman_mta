module PostmanMta
  class ApplicationModel
    delegate :get, :post, :put, :patch, :delete, :response_body, :response_status, to: :connection

    protected

    def connection
      @connection ||= PostmanMta::ApiClient.new
    end
  end
end
