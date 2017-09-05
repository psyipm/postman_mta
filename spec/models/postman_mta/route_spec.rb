require 'spec_helper'
require 'support/route_shared_context'

RSpec.describe PostmanMta::Route do
  include_context 'route'

  it 'should index routes' do
    routes = described_class.new.index
    expect(routes).to_not be_empty
  end
end
