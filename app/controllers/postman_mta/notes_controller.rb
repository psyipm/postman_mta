module PostmanMta
  class NotesController < ApplicationController
    def create
      render note.create(notes_params)
    end

    def update
      render note.update(notes_params[:id], notes_params)
    end

    private

    def note
      @note ||= PostmanMta::Note.new
    end

    def notes_params
      params.permit!
    end
  end
end
