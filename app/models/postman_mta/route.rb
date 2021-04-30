module PostmanMta
  class Route < ApplicationModel
    def index
      get('/routes')
    end

    def update(uuid, params = {})
      patch("/routes/#{uuid}", body: params)
    end

    def create(params = {})
      post('/routes', body: params)
    end

    def destroy(uuid, params = {})
      delete("/routes/#{uuid}", body: params)
    end
  end
end
