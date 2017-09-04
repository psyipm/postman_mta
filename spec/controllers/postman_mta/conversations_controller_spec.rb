require 'spec_helper'
require 'support/conversation_shared_context'

RSpec.describe PostmanMta::ConversationsController, type: :controller do
  include_context 'conversation'

  let(:conversation_id) { 1 }

  it 'should index conversations' do
    get :index
    expect(response).to be_success
    expect(response.body).to match(/conversations[\w\W]+test message/)
  end

  it 'should show conversation with messages' do
    get :show, params: { id: conversation_id }
    expect(response).to be_success
    expect(response.body).to match(/conversation[\w\W]+test message/)
  end

  it 'should mark conversations as read' do
    put :read, params: { conversation_ids: [conversation_id] }

    expect(response).to be_success
  end
end
