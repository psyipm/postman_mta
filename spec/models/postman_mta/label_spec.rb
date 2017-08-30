require 'spec_helper'
require 'support/label_shared_context'

RSpec.describe PostmanMta::Label do
  include_context 'label'

  it 'should create label for conversation' do
    label = described_class.new(conversation_id).create(label_params)
    expect(label['status']).to match(/success/)
  end

  it 'should destroy label' do
    label = described_class.new(conversation_id).destroy(1)
    expect(label['status']).to match(/success/)
  end
end
