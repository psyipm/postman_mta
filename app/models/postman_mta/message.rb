module PostmanMta
  class Message < ApplicationModel
    def find(token)
      get("/api/v1/messages/#{token}")
    end

    def create(params)
      post('/api/v1/messages', body: params)
    end

    def unread_stats
      get('/api/v1/stats/messages/unread')
    end
  end
end
