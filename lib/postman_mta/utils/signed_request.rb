module PostmanMta
  module Utils
    class SignedRequest
      attr_reader :options

      delegate :api_key, :api_secret, to: :PostmanMta

      def initialize(options = {})
        @options = options

        @options[:timestamp] ||= Time.zone.now.to_i
      end

      def headers
        {
          'X-Access-Key' => api_key,
          'X-Timestamp' => options[:timestamp].to_s,
          'X-Signature' => signature
        }
      end

      def signature
        generator.generate_signature(api_secret)
      end

      def generator
        @_generator ||= PostmanMta::Utils::Signature.new(options.merge(access_key: api_key))
      end
    end
  end
end
