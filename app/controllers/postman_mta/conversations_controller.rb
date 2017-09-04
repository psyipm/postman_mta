module PostmanMta
  class ConversationsController < ApplicationController
    def index
      render json: conversation.index(permitted_params).as_json
    end

    def show
      render json: conversation.find(params[:id]).as_json
    end

    def read
      render json: conversation.mark_as_read(permitted_params).as_json
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
