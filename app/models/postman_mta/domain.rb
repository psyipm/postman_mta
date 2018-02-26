module PostmanMta
  class Domain < ApplicationModel
    def index(params = {})
      get('/domains', body: params)
    end

    def create(params = {})
      post('/domains', body: params)
    end

    def dns_setup(uuid)
      put("/domains/#{uuid}/dns_setup")
    end
  end
end
