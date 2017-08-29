module PostmanMta
  class ApplicationController < ActionController::Metal
    abstract!

    MODULES = [
      AbstractController::Rendering,
      ActionController::HideActions,

      ActionController::UrlFor,
      ActionController::Redirecting,
      ActionController::Renderers::All,
      ActionController::ConditionalGet,
      ActionController::RackDelegation,

      ActionController::ForceSSL,

      AbstractController::Callbacks,
      ActionController::StrongParameters,

      # Append rescue at the bottom to wrap as much as possible.
      ActionController::Rescue,

      # Add instrumentations hooks at the bottom, to ensure they instrument
      # all the methods properly.
      ActionController::Instrumentation
    ].freeze

    MODULES.each do |mod|
      include mod
    end

    include Rails.application.routes.url_helpers
  end
end
