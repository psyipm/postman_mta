module PostmanMta
  class LabelsController < ApplicationController
    def create
      render json: label.create(label_params).as_json
    end

    def destroy
      render json: label.destroy(params[:id]).as_json
    end

    private

    def label
      @label ||= PostmanMta::Label.new(params[:conversation_id])
    end

    def label_params
      params.permit!
    end
  end
end
