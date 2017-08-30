RSpec.shared_context 'label', shared_context: :metadata do
  let(:create_label_success_body) { File.new('spec/stubs/labels/create_label_success_body.json') }
  let(:destroy_label_success_body) { File.new('spec/stubs/labels/destroy_label_success_body.json') }
  let(:headers) { { 'Content-type' => 'application/json' } }

  let(:conversation_id) { 1 }
  let(:label_params) { { title: 'test label', sort_order: 1, color: '#ff0000' } }

  before(:each) do
    stub_request(:post, Regexp.new('/api/v1/conversations/[\d]+/labels'))
      .to_return(status: 201, body: create_label_success_body, headers: headers)

    stub_request(:delete, Regexp.new('/api/v1/conversations/[\d]+/labels/[\d]+'))
      .to_return(status: 201, body: destroy_label_success_body, headers: headers)
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'label', include_shared: true
end
