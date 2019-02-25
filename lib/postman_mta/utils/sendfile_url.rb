require 'uri'

module PostmanMta
  module Utils
    class SendfileUrl
      PREFIX = '/private'.freeze

      def initialize(data)
        @data = data
      end

      def uri
        @uri ||= URI(@data)
      end

      def to_url
        File.join(PREFIX, uri.host, "#{uri.path}?#{uri.query}")
      end
    end
  end
end
