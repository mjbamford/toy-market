require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /session/new" do
    it "renders the login form" do
      get "/session/new"
      expect(response).to have_http_status 200
      expect(response).to render_template "_form"
      expect(response).to render_template "new"
      expect(response).to render_template "application"
    end
  end
end
