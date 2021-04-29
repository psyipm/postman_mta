RSpec.shared_context 'conversation', shared_context: :metadata do
  let(:index_conversations_success_body) do
    File.new('spec/stubs/conversations/index_conversations_success_body.json')
  end

  let(:show_conversation_success_body) do
    File.new('spec/stubs/conversations/show_conversation_success_body.json')
  end

  let(:read_conversations_success_body) do
    File.new('spec/stubs/conversations/read_conversations_success_body.json')
  end

  let(:delete_conversation_success_body) do
    File.new('spec/stubs/conversations/delete_conversation_success_body.json')
  end

  let(:move_conversations_success_body) do
    File.new('spec/stubs/conversations/move_conversations_success_body.json')
  end

  let(:move_archive_conversations_success_body) do
    File.new('spec/stubs/conversations/move_conversations_success_body.json')
  end

  let(:search_conversations_success_body) do
    File.new('spec/stubs/conversations/index_conversations_success_body.json')
  end

  let(:headers) { { 'Content-type' => 'application/json' } }

  before(:each) do
    stub_request(:get, Regexp.new('/api/v1/conversations'))
      .to_return(status: 200, body: index_conversations_success_body, headers: headers)

    stub_request(:get, Regexp.new('/api/v1/conversations/[\d]*'))
      .to_return(status: 200, body: show_conversation_success_body, headers: headers)

    stub_request(:patch, Regexp.new('/api/v1/conversations/mark'))
      .to_return(status: 200, body: read_conversations_success_body, headers: headers)

    stub_request(:delete, Regexp.new('/api/v1/conversations/[\d]+/trash'))
      .to_return(status: 200, body: delete_conversation_success_body, headers: headers)

    stub_request(:patch, Regexp.new('/api/v1/conversations/move'))
      .to_return(status: 200, body: move_conversations_success_body, headers: headers)

    stub_request(:patch, Regexp.new('/api/v1/archive/conversations/move'))
      .to_return(status: 200, body: move_archive_conversations_success_body, headers: headers)

    stub_request(:get, Regexp.new('/api/v1/search/conversations'))
      .to_return(status: 200, body: search_conversations_success_body, headers: headers)
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'conversation', include_shared: true
end
