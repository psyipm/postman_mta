module PostmanMta
  module Archive
    class ConversationsController < ApplicationController
      def index
        render conversation.index(permitted_params)
      end

      def show
        render conversation.find(params[:id])
      end

      private

      def conversation
        @conversation ||= PostmanMta::Archive::Conversation.new
      end

      def permitted_params
        params.permit!
      end
    end
  end
end
