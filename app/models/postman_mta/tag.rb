module PostmanMta
  class Tag < ApplicationModel
    attr_reader :conversation_id

    def initialize(conversation_id)
      @conversation_id = conversation_id
    end

    def create(params)
      post("/conversations/#{conversation_id}/tags", body: params)
    end

    def destroy(tag_id)
      delete("/conversations/#{conversation_id}/tags/#{tag_id}")
    end
  end
end
