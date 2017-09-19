require 'spec_helper'
require 'support/attachment_shared_context'

RSpec.describe PostmanMta::Attachment do
  include_context 'attachment'

  it 'should show conversations' do
    attachment = described_class.new('some_message_token').find('some_attachment_uuid')

    expect(attachment[:json]).to_not be_empty
    expect(attachment[:status]).to eq 200
  end
end
