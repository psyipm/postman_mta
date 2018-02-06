module PostmanMta
  class Conversation < ApplicationModel
    def index(params = {})
      get('/conversations', body: params)
    end

    def folder(folder, params = {})
      params = {
        folder: folder
      }.merge(params)

      get('/conversations', body: params)
    end

    def find(conversation_id)
      get("/conversations/#{conversation_id}")
    end

    def move_to_trash(conversation_id)
      delete("/conversations/#{conversation_id}/trash")
    end

    def mark_as_read(params = {})
      patch('/conversations/mark', body: params.merge(event: 'mark_as_read'))
    end

    def mark_as_unread(params = {})
      patch('/conversations/mark', body: params.merge(event: 'mark_as_unread'))
    end

    def move(params = {})
      patch('/conversations/move', body: params)
    end

    def search(params = {})
      get('/conversations', body: params)
    end
  end
end
