module PostmanMta
  class Conversation < ApplicationModel
    def index(params = {})
      get('/api/v1/conversations', body: params)
    end

    def folder(folder, params = {})
      params = {
        folder: folder
      }.merge(params)

      get('/api/v1/conversations', body: params)
    end

    def find(conversation_id)
      get("/api/v1/conversations/#{conversation_id}")
    end

    def move_to_trash(conversation_id)
      delete("/api/v1/conversations/#{conversation_id}/trash")
    end

    def mark_as_read(params = {})
      patch('/api/v1/conversations/read', body: params)
    end
  end
end
