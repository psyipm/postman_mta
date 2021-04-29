RSpec.shared_context 'note', shared_context: :metadata do
  let(:create_note_success_body) { File.new('spec/stubs/notes/create_note_success_body.json') }
  let(:update_note_success_body) { File.new('spec/stubs/notes/update_note_success_body.json') }
  let(:headers) { { 'Content-type' => 'application/json' } }

  let(:create_note_params) do
    {
      content: 'test note', user_id: 1, user_name: 'User', user_role: 'Role', message_id: 1
    }
  end

  let(:update_note_params) { { id: 1, content: 'updated note', user_id: 1 } }

  before(:each) do
    stub_request(:post, Regexp.new('/api/v1/notes'))
      .to_return(status: 201, body: create_note_success_body, headers: headers)

    stub_request(:patch, Regexp.new('/api/v1/notes/[\d]*'))
      .to_return(status: 200, body: update_note_success_body, headers: headers)
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'note', include_shared: true
end
