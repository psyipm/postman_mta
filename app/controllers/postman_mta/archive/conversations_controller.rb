module PostmanMta
  module Archive
    class ConversationsController < ApplicationController
      def index
        render conversation.archive(permitted_params)
      end

      private

      def conversation
        @conversation ||= PostmanMta::Conversation.new
      end

      def permitted_params
        params.permit!
      end
    end
  end
end
