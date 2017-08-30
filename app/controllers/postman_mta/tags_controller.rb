module PostmanMta
  class TagsController < ApplicationController
    def create
      render json: tag.create(tag_params).as_json
    end

    def destroy
      render json: tag.destroy(params[:id]).as_json
    end

    private

    def tag
      @tag ||= PostmanMta::Tag.new(params[:conversation_id])
    end

    def tag_params
      params.permit!
    end
  end
end
