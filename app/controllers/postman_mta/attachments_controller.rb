module PostmanMta
  class AttachmentsController < ApplicationController
    def show
      render attachment.find(params[:uuid])
    end

    private

    def attachment
      @attachment ||= PostmanMta::Attachment.new(params[:message_token])
    end
  end
end
