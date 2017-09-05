require 'spec_helper'
require 'support/route_shared_context'

RSpec.describe PostmanMta::RoutesController, type: :controller do
  include_context 'route'

  it 'should render index action' do
    get :index

    expect(response).to be_success
    expect(response.body).to match(/routes[\w\W]+domain[\w\W]+id[\w\W]+uuid/)
  end
end
