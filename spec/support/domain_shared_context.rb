RSpec.shared_context 'domain', shared_context: :metadata do
  let(:headers) { { 'Content-type' => 'application/json' } }

  let(:get_domains_success_body) { File.new('spec/stubs/domains/get_domains_success_body.json') }
  let(:create_domain_success_body) { File.new('spec/stubs/domains/create_domain_success_body.json') }

  before(:each) do
    stub_request(:get, Regexp.new('/api/v1/domains'))
      .to_return(status: 200, body: get_domains_success_body, headers: headers)

    stub_request(:post, Regexp.new('/api/v1/domains'))
      .to_return(status: 201, body: create_domain_success_body, headers: headers)
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'domain', include_shared: true
end
