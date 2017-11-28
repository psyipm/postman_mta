require 'spec_helper'
require 'support/attachment_shared_context'

RSpec.describe PostmanMta::Attachment do
  include_context 'attachment'

  it 'should show conversations' do
    attachment = described_class.new('some_message_token')
    attachment.find('some_attachment_uuid')

    expect(attachment.response_body).to_not be_empty
    expect(attachment.response_status).to eq 200
  end
end
