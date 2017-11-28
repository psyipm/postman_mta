module PostmanMta
  class Credential < ApplicationModel
    def create(params = {})
      post('/api/v1/credentials', body: params)
    end
  end
end
