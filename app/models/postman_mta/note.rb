module PostmanMta
  class Note < ApplicationModel
    def create(params)
      post('/notes', body: params)
    end

    def update(note_id, params)
      patch("/notes/#{note_id}", body: params)
    end
  end
end
