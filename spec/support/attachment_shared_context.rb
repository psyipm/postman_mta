RSpec.shared_context 'attachment', shared_context: :metadata do
  let(:get_attachment_success_body) { File.new('spec/stubs/attachments/get_attachment_success_body.json') }
  let(:headers) { { 'Content-type' => 'application/json' } }

  before(:each) do
    stub_request(:get, Regexp.new('/api/v1/messages/[_\w\d]+/attachments/[_\w\d]+'))
      .to_return(status: 200, body: get_attachment_success_body, headers: headers)
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'attachment', include_shared: true
end
