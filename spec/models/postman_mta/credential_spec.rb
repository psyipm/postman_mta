require 'spec_helper'

RSpec.describe PostmanMta::Credential do
  let(:headers) { { 'Content-type' => 'application/json' } }

  let(:create_credentials_success_body) do
    File.new('spec/stubs/credentials/create_success_body.json')
  end

  before(:each) do
    stub_request(:post, Regexp.new('/api/v1/credentials'))
      .to_return(status: 201, body: create_credentials_success_body, headers: headers)
  end

  it 'should create credentials' do
    credential = PostmanMta::Credential.new.create(name: 'support@example.com', domain_uuid: 'some-uuid')

    expect(WebMock).to have_requested(:post, Regexp.new('/api/v1/credentials'))
    expect(credential).to_not be_empty
  end
end
