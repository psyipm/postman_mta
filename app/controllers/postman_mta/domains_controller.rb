module PostmanMta
  class DomainsController < ApplicationController
    def index
      render domain.index
    end

    private

    def domain
      @domain ||= PostmanMta::Domain.new
    end
  end
end
