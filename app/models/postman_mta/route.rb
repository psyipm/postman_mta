module PostmanMta
  class Route < ApplicationModel
    def index
      get('/api/v1/routes')
    end

    def update(uuid, params = {})
      patch("/api/v1/routes/#{uuid}", body: params)
    end

    def create(params = {})
      post('/api/v1/routes', body: params)
    end
  end
end
