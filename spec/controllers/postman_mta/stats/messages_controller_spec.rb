require 'spec_helper'
require 'support/message_shared_context'

RSpec.describe PostmanMta::Stats::MessagesController, type: :controller do
  include_context 'message'

  it 'should render unread messages stats' do
    get :unread

    expect(response).to be_success
    expect(response.body).to have_node(:inbox).with(1)
    expect(response.body).to have_node(:labels)
  end
end
