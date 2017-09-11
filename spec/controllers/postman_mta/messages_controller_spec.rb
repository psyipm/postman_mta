require 'spec_helper'
require 'support/message_shared_context'

RSpec.describe PostmanMta::MessagesController, type: :controller do
  include_context 'message'

  let(:message_id) { 1 }

  it 'should render show action' do
    get :show, params: { id: message_id }
    expect(response).to be_success
    expect(response.body).to match(/test message/)
  end

  it 'should render create action' do
    post :create, params: { from: 'tester@test.com', to: 'support@example.com', plain_body: 'test message' }

    expect(response).to be_success
    expect(response.body).to match(/success/)
  end
end
