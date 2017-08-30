RSpec.shared_context 'conversation', shared_context: :metadata do
  let(:index_conversations_success_body) do
    File.new('spec/stubs/conversations/index_conversations_success_body.json')
  end

  let(:show_conversation_success_body) do
    File.new('spec/stubs/conversations/show_conversation_success_body.json')
  end

  let(:headers) { { 'Content-type' => 'application/json' } }

  before(:each) do
    stub_request(:get, Regexp.new('/api/v1/conversations'))
      .to_return(status: 200, body: index_conversations_success_body, headers: headers)

    stub_request(:get, Regexp.new('/api/v1/conversations/[\d]*'))
      .to_return(status: 200, body: show_conversation_success_body, headers: headers)
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'conversation', include_shared: true
end
