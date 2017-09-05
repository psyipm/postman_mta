module PostmanMta
  class Route < ApplicationModel
    def index
      get('/api/v1/routes')
    end
  end
end
