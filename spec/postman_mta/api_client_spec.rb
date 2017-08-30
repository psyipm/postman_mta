require 'spec_helper'

RSpec.describe PostmanMta::ApiClient do
  let(:client) { described_class.new }
  let(:args) { ['/api/v1/messages/1', body: {}] }

  before(:each) do
    expect(client).to receive(:perform_request).and_return(true)
  end

  [:get, :post, :put, :patch, :delete].each do |meth|
    it "should define method `#{meth}`" do
      expect(client.respond_to?(meth)).to eq true
      expect(client.send(meth, *args)).to eq true
    end
  end
end
