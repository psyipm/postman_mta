module PostmanMta
  class LabelsController < ApplicationController
    def create
      render label.create(label_params)
    end

    def destroy
      render label.destroy(params[:id])
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
