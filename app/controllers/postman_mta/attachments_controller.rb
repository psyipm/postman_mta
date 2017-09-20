module PostmanMta
  class AttachmentsController < ApplicationController
    include ActionController::DataStreaming

    def show
      response = attachment.find(params[:uuid]).deep_symbolize_keys
      file = response.dig(:json, :attachment)
      file_data = Base64.decode64(file[:body])

      send_data(file_data, type: file[:content_type], filename: file[:filename], dispostion: 'attachment')
    end

    private

    def attachment
      @attachment ||= PostmanMta::Attachment.new(params[:message_token])
    end
  end
end
