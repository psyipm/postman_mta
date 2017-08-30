require 'spec_helper'
require 'support/message_shared_context'

RSpec.describe PostmanMta::Message do
  include_context 'message'

  it 'should find message by id' do
    message = described_class.new.find(1)
    expect(message).to_not be_empty
    expect(message.dig('message', 'plain_body')).to eq('test message')
  end

  it 'should create message from params' do
    params = { from: 'tester@test.com', to: 'support@example.com', plain_body: 'test message' }
    message = described_class.new.create(params)

    expect(message).to_not be_empty
    expect(message['status']).to eq('success')
  end
end
