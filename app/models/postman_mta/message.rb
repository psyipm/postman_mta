module PostmanMta
  class Message < ApplicationModel
    def find(message_id)
      get("/api/v1/messages/#{message_id}")
    end

    def create(params)
      post('/api/v1/messages', body: params)
    end
  end
end
