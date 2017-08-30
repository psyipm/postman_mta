module PostmanMta
  class ConversationsController < ApplicationController
    def index
      render json: conversation.index(filter_params).as_json
    end

    def show
      render json: conversation.find(params[:id]).as_json
    end

    private

    def conversation
      @conversation ||= PostmanMta::Conversation.new
    end

    def filter_params
      params.permit!
    end
  end
end
