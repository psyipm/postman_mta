module PostmanMta
  class MessagesController < ApplicationController
    def show
      render json: message.find(params[:id]).as_json
    end

    def create
      render json: message.create(params).as_json
    end

    private

    def message
      @message ||= PostmanMta::Models::Message.new
    end
  end
end
