module PostmanMta
  class Message < ApplicationModel
    def find(token)
      get("/api/v1/messages/#{token}")
    end

    def create(params)
      post('/api/v1/messages', body: params)
    end
  end
end
