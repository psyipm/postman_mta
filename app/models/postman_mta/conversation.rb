module PostmanMta
  class Conversation < ApplicationModel
    def index(params = {})
      get('/api/v1/conversations', body: params)
    end

    def find(conversation_id)
      get("/api/v1/conversations/#{conversation_id}")
    end
  end
end
