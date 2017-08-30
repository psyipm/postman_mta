require 'spec_helper'
require 'support/label_shared_context'

RSpec.describe PostmanMta::LabelsController, type: :controller do
  include_context 'label'

  it 'should create label' do
    post :create, params: label_params.merge(conversation_id: conversation_id)

    expect(response).to be_success
    expect(response.body).to match(/success/)
  end

  it 'should destroy label' do
    delete :destroy, params: { conversation_id: conversation_id, id: 1 }

    expect(response).to be_success
    expect(response.body).to match(/success/)
  end
end
