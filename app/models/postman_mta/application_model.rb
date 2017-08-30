module PostmanMta
  class ApplicationModel
    delegate :get, :post, :put, :patch, :delete, to: :connection

    protected

    def connection
      @connection ||= PostmanMta::ApiClient.new
    end
  end
end
