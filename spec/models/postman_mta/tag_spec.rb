require 'spec_helper'
require 'support/tag_shared_context'

RSpec.describe PostmanMta::Tag do
  include_context 'tag'

  it 'should create tag' do
    tag = described_class.new(conversation_id).create(tag_params)
    expect(tag[:json]['status']).to match(/success/)
  end

  it 'should destroy tag' do
    tag = described_class.new(conversation_id).destroy(1)
    expect(tag[:json]['status']).to match(/success/)
  end
end
