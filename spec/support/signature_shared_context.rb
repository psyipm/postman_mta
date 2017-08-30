RSpec.shared_context 'signature', shared_context: :metadata do
  let(:api_key) { 'test_api_key' }
  let(:api_secret) { 'test_api_secret' }
  let(:timestamp) { '1504106787' }
  let(:path) { '/api/v1/messages/1' }
  let(:signature_options) { { request_type: 'GET', path: path, timestamp: timestamp, access_key: api_key } }

  let(:valid_signature) { 'YvyR+VKY1VREooZDNLtCZ7Jhu7YkxQQ0a9Zk928bLYc=' }
end

RSpec.configure do |rspec|
  rspec.include_context 'signature', include_shared: true
end
