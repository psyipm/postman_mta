RSpec.shared_context 'tag', shared_context: :metadata do
  let(:create_tag_success_body) { File.new('spec/stubs/tags/create_tag_success_body.json') }
  let(:destroy_tag_success_body) { File.new('spec/stubs/tags/destroy_tag_success_body.json') }
  let(:headers) { { 'Content-type' => 'application/json' } }

  let(:conversation_id) { 1 }
  let(:tag_params) { { title: 'client_id', value: '12412414' } }

  before(:each) do
    stub_request(:post, Regexp.new('/api/v1/conversations/[\d]+/tags'))
      .to_return(status: 201, body: create_tag_success_body, headers: headers)

    stub_request(:delete, Regexp.new('/api/v1/conversations/[\d]+/tags/[\d]+'))
      .to_return(status: 201, body: destroy_tag_success_body, headers: headers)
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'tag', include_shared: true
end
