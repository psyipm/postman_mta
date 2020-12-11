module PostmanMta
  class AttachmentsController < ApplicationController
    include ActionController::DataStreaming

    def show
      response = attachment.find(params[:uuid]).deep_symbolize_keys
      file = response.dig(:json, :attachment)
      raise(PostmanMta::RecordNotFound, "Attachment via id #{params[:uuid]} not found") unless file

      if file[:body].present?
        send_attachment(file)
      else
        proxy_attachment(file)
      end
    end

    private

    def attachment
      @attachment ||= PostmanMta::Attachment.new(params[:message_token])
    end

    def send_attachment(file)
      file_data = Base64.decode64(file[:body])
      send_data(file_data, type: file[:content_type], filename: file[:filename], dispostion: 'attachment')
    end

    def proxy_attachment(file)
      headers['X-Accel-Redirect'] = PostmanMta::Utils::SendfileUrl.new(file[:url]).to_url
      headers['Content-Disposition'] = "attachment; filename=\"#{file[:filename]}\""
    end
  end
end
