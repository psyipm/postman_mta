module PostmanMta
  class MessagesController < ApplicationController
    def show
      render message.find(params[:id])
    end

    def create
      render message.create(message_params)
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
