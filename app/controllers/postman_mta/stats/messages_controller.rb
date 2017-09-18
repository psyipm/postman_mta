module PostmanMta
  module Stats
    class MessagesController < ApplicationController
      def unread
        render message.unread_stats
      end

      private

      def message
        @message ||= PostmanMta::Message.new
      end
    end
  end
end
