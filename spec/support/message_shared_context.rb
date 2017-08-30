RSpec.shared_context 'message', shared_context: :metadata do
  let(:get_message_success_body) { File.new('spec/stubs/messages/get_message_success_body.json') }
  let(:create_message_success_body) { File.new('spec/stubs/messages/create_message_success_body.json') }
  let(:headers) { { 'Content-type' => 'application/json' } }

  before(:each) do
    stub_request(:get, Regexp.new('/api/v1/messages/[\d]*'))
      .to_return(status: 200, body: get_message_success_body, headers: headers)

    stub_request(:post, Regexp.new('/api/v1/messages'))
      .to_return(status: 201, body: create_message_success_body, headers: headers)
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'message', include_shared: true
end
