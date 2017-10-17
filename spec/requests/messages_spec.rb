require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  describe 'GET /messages' do
    it 'returns returns status 200' do
      get messages_path
      expect(response).to have_http_status 200
    end
  end
end
