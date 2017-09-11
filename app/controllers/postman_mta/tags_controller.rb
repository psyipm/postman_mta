module PostmanMta
  class TagsController < ApplicationController
    def create
      render tag.create(tag_params)
    end

    def destroy
      render tag.destroy(params[:id])
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
