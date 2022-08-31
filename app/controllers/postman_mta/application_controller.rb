module PostmanMta
  class ApplicationController < ActionController::Metal
    abstract!

    MODULES = [
      AbstractController::Rendering,

      ActionController::UrlFor,
      ActionController::Redirecting,
      ActionController::Renderers::All,
      ActionController::ConditionalGet,

      AbstractController::Callbacks,
      ActionController::StrongParameters,

      # Append rescue at the bottom to wrap as much as possible.
      ActionController::Rescue,

      # Add instrumentations hooks at the bottom, to ensure they instrument
      # all the methods properly.
      ActionController::Instrumentation,

      # Params wrapper should come before instrumentation so they are
      # properly showed in logs
      ActionController::ParamsWrapper
    ].freeze

    MODULES.each do |mod|
      include mod
    end

    include Rails.application.routes.url_helpers
  end
end
