module PostmanMta
  module Archive
    class Conversation < PostmanMta::Conversation
      def index(params = {})
        get('/archive/conversations', body: params)
      end

      def find(conversation_id)
        get("/archive/conversations/#{conversation_id}")
      end

      def move(params = {})
        patch('/archive/conversations/move', body: params)
      end
    end
  end
end
