Rails.application.routes.draw do
  mount PostmanMta::Engine => "/postman_mta"
end
