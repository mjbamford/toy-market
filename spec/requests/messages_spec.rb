require "rails_helper"

RSpec.describe "Messages", type: :request do
  let!(:seller) { create :seller }
  let!(:buyer)  { create :buyer }

  describe "login and view messages" do
    it "shows the messages for the logged in user" do
      get "/session/new"
      expect(response).to be_successful
      post "/session", params: { username: seller.username, password: '' }
      expect(response).to be_redirect
      get "/messages"
      expect(response).to have_http_status 200
      expect(response.body).to match "Sally's Messages"
    end
  end
end
