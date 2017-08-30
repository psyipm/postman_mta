require 'spec_helper'
require 'support/signature_shared_context'

RSpec.describe PostmanMta::Utils::SignedRequest do
  include_context 'signature'

  let(:signed_request) { described_class.new(signature_options) }

  it 'should read api_key and api_secret from configuration' do
    expect(signed_request.api_key).to eq PostmanMta.api_key
    expect(signed_request.api_secret).to eq PostmanMta.api_secret
  end

  it 'should generate valid signature' do
    expect(signed_request.signature).to eq valid_signature
  end

  it 'should return access headers' do
    headers = signed_request.headers

    expect(headers['X-Access-Key']).to eq api_key
    expect(headers['X-Timestamp']).to eq timestamp
    expect(headers['X-Signature']).to eq valid_signature
  end
end
