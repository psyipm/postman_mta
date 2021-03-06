require 'spec_helper'
require 'support/conversation_shared_context'

RSpec.describe PostmanMta::Archive::ConversationsController, type: :controller do
  include_context 'conversation'

  let(:archive_conversations_success_body) do
    File.new('spec/stubs/conversations/index_conversations_success_body.json')
  end

  let(:conversation_id) { 1 }

  before(:each) do
    stub_request(:get, Regexp.new('/api/v1/archive/conversations'))
      .to_return(status: 200, body: archive_conversations_success_body, headers: headers)
  end

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

  it 'should move conversation to folder' do
    put :move, params: { conversation_ids: [conversation_id], folder: 'inbox' }

    expect(response).to be_success
  end
end
