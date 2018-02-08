require 'spec_helper'
require 'support/domain_shared_context'

RSpec.describe PostmanMta::DomainsController, type: :controller do
  include_context 'domain'

  it 'should render index action' do
    get :index

    expect(response).to be_success
    expect(response.body).to match(/client_id[\w\W]+host[\w\W]+id[\w\W]+uuid/)
  end
end
