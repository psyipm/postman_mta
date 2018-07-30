module PostmanMta
  class Bookmark < ApplicationModel
    attr_reader :target_type, :target_id

    def initialize(target_type, target_id)
      @target_type = target_type
      @target_id = target_id
    end

    def create(params)
      post("/#{target_type}/#{target_id}/bookmarks", body: params)
    end

    def destroy(bookmark_id)
      delete("/#{target_type}/#{target_id}/bookmarks/#{bookmark_id}")
    end
  end
end
