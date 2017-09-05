RSpec.shared_context 'route', shared_context: :metadata do
  let(:get_routes_success_body) { File.new('spec/stubs/routes/get_routes_success_body.json') }
  let(:headers) { { 'Content-type' => 'application/json' } }

  before(:each) do
    stub_request(:get, Regexp.new('/api/v1/routes'))
      .to_return(status: 200, body: get_routes_success_body, headers: headers)
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'route', include_shared: true
end
