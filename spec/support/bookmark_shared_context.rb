RSpec.shared_context 'bookmark', shared_context: :metadata do
  let(:create_success_body) { File.new('spec/stubs/tags/create_tag_success_body.json') }
  let(:destroy_success_body) { File.new('spec/stubs/tags/destroy_tag_success_body.json') }
  let(:headers) { { 'Content-type' => 'application/json' } }

  let(:message_id) { 1 }
  let(:bookmark_params) { { title: 'client_id', value: '12412414' } }

  before(:each) do
    stub_request(:post, Regexp.new('/api/v1/messages/[\d]+/bookmarks'))
      .to_return(status: 201, body: create_success_body, headers: headers)

    stub_request(:delete, Regexp.new('/api/v1/messages/[\d]+/bookmarks/[\d]+'))
      .to_return(status: 201, body: destroy_success_body, headers: headers)
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'bookmark', include_shared: true
end
