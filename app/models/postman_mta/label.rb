module PostmanMta
  class Label < ApplicationModel
    attr_reader :conversation_id

    def initialize(conversation_id)
      @conversation_id = conversation_id
    end

    def index(params = {})
      get('/labels', body: params)
    end

    def create(params)
      post("/conversations/#{conversation_id}/labels", body: params)
    end

    def update(label_id, params)
      patch("/conversations/#{conversation_id}/labels/#{label_id}", body: params)
    end

    def destroy(label_id)
      delete("/conversations/#{conversation_id}/labels/#{label_id}")
    end
  end
end
