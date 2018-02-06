module PostmanMta
  class Credential < ApplicationModel
    def create(params = {})
      post('/credentials', body: params)
    end
  end
end
