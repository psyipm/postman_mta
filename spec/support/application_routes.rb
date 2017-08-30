module ApplicationRoutes
  extend ActiveSupport::Concern

  included do
    routes { PostmanMta::Engine.routes }
  end
end
