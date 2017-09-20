require 'spec_helper'
require 'support/attachment_shared_context'

RSpec.describe PostmanMta::AttachmentsController, type: :controller do
  include_context 'attachment'

  it 'should show attachment' do
    get :show, params: { message_token: 'some_token', uuid: 'some_uuid' }

    expect(response).to be_success

    expect(response.headers['Content-Type']).to eq 'text/plain'
    expect(response.headers['Content-Disposition']).to match(/attachment[\w\W\s]+filename[\W]+file.txt/)
  end
end
