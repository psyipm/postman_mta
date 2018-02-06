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

  [:inbox, :sent, :spam, :trash].each do |folder|
    it "should show filtered conversations in `#{folder}` folder" do
      get folder

      expect(response).to be_success
    end
  end

  it 'should search conversations' do
    get :search, params: { q: 'test' }
    expect(response).to be_success
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

  it 'should mark conversations as unread' do
    put :unread, params: { conversation_ids: [conversation_id] }

    expect(response).to be_success
  end

  it 'should move conversation to trash' do
    delete :destroy, params: { id: conversation_id }

    expect(response).to be_success
  end

  it 'should move conversation to folder' do
    put :move, params: { conversation_ids: [conversation_id], folder: 'spam' }

    expect(response).to be_success
  end
end
