module PostmanMta
  class ConversationsController < ApplicationController
    def index
      render conversation.index(permitted_params)
    end

    [:inbox, :sent, :spam, :trash].each do |folder|
      define_method folder do
        render conversation.folder(folder, permitted_params)
      end
    end

    def show
      render conversation.find(params[:id])
    end

    def read
      render conversation.mark_as_read(permitted_params)
    end

    def destroy
      render conversation.move_to_trash(params[:id])
    end

    def move
      render conversation.move(permitted_params)
    end

    private

    def conversation
      @conversation ||= PostmanMta::Conversation.new
    end

    def permitted_params
      params.permit!
    end
  end
end
