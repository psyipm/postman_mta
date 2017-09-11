module PostmanMta
  class RoutesController < ApplicationController
    def index
      render route.index
    end

    private

    def route
      @route ||= PostmanMta::Route.new
    end
  end
end
