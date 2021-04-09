module PostmanMta
  class MessagesController < ApplicationController
    def show
      render message.find(params[:token])
    end

    def create
      data = message.create(message_params)

      head data[:status]
      render data
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
