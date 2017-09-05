module PostmanMta
  class RoutesController < ApplicationController
    def index
      render json: route.index.as_json
    end

    private

    def route
      @route ||= PostmanMta::Route.new
    end
  end
end
