module PostmanMta
  class DomainsController < ApplicationController
    def index
      render domain.index(permitted_params)
    end

    private

    def domain
      @domain ||= PostmanMta::Domain.new
    end

    def permitted_params
      params.permit!
    end
  end
end
