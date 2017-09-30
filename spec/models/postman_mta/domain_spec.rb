require 'spec_helper'
require 'support/domain_shared_context'

RSpec.describe PostmanMta::Domain do
  include_context 'domain'

  it 'should index domains' do
    domains = described_class.new.index

    expect(WebMock).to have_requested(:get, Regexp.new('/api/v1/domains'))
    expect(domains).to_not be_empty
  end

  it 'should create domain' do
    domain = described_class.new.create(name: 'example.com')

    expect(WebMock).to have_requested(:post, Regexp.new('/api/v1/domains'))
    expect(domain).to_not be_empty
  end
end
