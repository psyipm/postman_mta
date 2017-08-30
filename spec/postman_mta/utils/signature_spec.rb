require 'spec_helper'
require 'support/signature_shared_context'

RSpec.describe PostmanMta::Utils::Signature do
  include_context 'signature'

  let(:generator) { described_class.new(signature_options) }

  it 'should generate correct signature' do
    expect(generator.generate_signature(api_secret)).to eq valid_signature
  end
end
