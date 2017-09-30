module PostmanMta
  class Domain < ApplicationModel
    def index
      get('/api/v1/domains')
    end

    def create(params = {})
      post('/api/v1/domains', body: params)
    end
  end
end
