require 'spec_helper'
require 'support/conversation_shared_context'

RSpec.describe PostmanMta::Conversation do
  include_context 'conversation'

  let(:conversation_id) { 1 }

  it 'should index conversations' do
    conversations = described_class.new.index
    expect(conversations).to_not be_empty
  end

  it 'should show conversations' do
    conversation = described_class.new.find(conversation_id)
    expect(conversation).to_not be_empty
  end
end
