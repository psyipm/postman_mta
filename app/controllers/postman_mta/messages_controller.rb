module PostmanMta
  class MessagesController < ApplicationController
    def show
      render json: message.find(params[:id]).as_json
    end

    def create
      render json: message.create(message_params).as_json
    end

    private

    def message
      @message ||= PostmanMta::Message.new
    end

    def message_params
      params.permit!
    end
  end
end
