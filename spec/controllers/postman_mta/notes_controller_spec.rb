require 'spec_helper'
require 'support/note_shared_context'

RSpec.describe PostmanMta::NotesController, type: :controller do
  include_context 'note'

  it 'should create note' do
    post :create, params: create_note_params

    expect(response).to be_success
    expect(response.body).to match(/some_token/)
  end

  it 'should update note' do
    patch :update, params: update_note_params

    expect(response).to be_success
    expect(response.body).to match(/some_token/)
  end
end
