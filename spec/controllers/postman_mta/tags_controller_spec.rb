require 'spec_helper'
require 'support/tag_shared_context'

RSpec.describe PostmanMta::TagsController, type: :controller do
  include_context 'tag'

  it 'should create tag' do
    post :create, params: tag_params.merge(conversation_id: conversation_id)

    expect(response).to be_success
    expect(response.body).to match(/success/)
  end

  it 'should destroy tag' do
    delete :destroy, params: { conversation_id: conversation_id, id: 1 }

    expect(response).to be_success
    expect(response.body).to match(/success/)
  end
end
