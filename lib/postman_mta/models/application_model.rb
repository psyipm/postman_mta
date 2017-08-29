module PostmanMta
  module Models
    class ApplicationModel
      delegate :get, :post, :put, :patch, to: :connection

      protected

      def connection
        @connection ||= PostmanMta::ApiClient.new
      end
    end
  end
end
