module PostmanMta
  class Message < ApplicationModel
    def find(token)
      get("/messages/#{token}")
    end

    def create(params)
      post('/messages', body: params)
    end

    def unread_stats
      get('/stats/messages/unread')
    end

    def search(params = {})
      get('/search/messages', body: params)
    end
  end
end
