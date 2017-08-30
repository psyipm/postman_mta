require 'spec_helper'

RSpec.describe PostmanMta do
  it 'has a version number' do
    expect(PostmanMta::VERSION).not_to be nil
  end

  it 'accepts configuration' do
    key = 'some_api_key'
    secret = 'some_api_secret'
    endpoint = 'some_endpoint'

    PostmanMta.setup do |config|
      config.api_key = key
      config.api_secret = secret
      config.api_endpoint = endpoint
    end

    expect(PostmanMta.api_key).to eq key
    expect(PostmanMta.api_secret).to eq secret
    expect(PostmanMta.api_endpoint).to eq endpoint
  end
end
