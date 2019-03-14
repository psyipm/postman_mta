module PostmanMta
  class LabelsController < ApplicationController
    def index
      render label.index(label_params)
    end

    def create
      render label.create(label_params)
    end

    def update
      render label.update(params[:id], label_params)
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
