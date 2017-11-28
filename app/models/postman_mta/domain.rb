module PostmanMta
  class Domain < ApplicationModel
    def index
      get('/api/v1/domains')
    end

    def create(params = {})
      post('/api/v1/domains', body: params)
    end

    def dns_setup(uuid)
      put("/api/v1/domains/#{uuid}/dns_setup")
    end
  end
end
