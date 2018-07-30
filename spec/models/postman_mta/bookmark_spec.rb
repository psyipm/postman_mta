require 'spec_helper'
require 'support/bookmark_shared_context'

RSpec.describe PostmanMta::Bookmark do
  include_context 'bookmark'

  it 'should create bookmark' do
    bookmark = described_class.new('messages', message_id).create(bookmark_params)
    expect(bookmark[:json]['status']).to match(/success/)
  end

  it 'should destroy bookmark' do
    bookmark = described_class.new('messages', message_id).destroy(1)
    expect(bookmark[:json]['status']).to match(/success/)
  end
end
