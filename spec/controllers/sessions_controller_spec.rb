require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create :seller }
  let(:valid_attributes) {{ username: user.username, password: '' }}

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Session" do
        expect {
          post :create, params: valid_attributes
        }.to change { session[:user_id] }.from(nil).to user.id
      end

      it "redirects to the created session" do
        post :create, params: valid_attributes
        expect(response).to redirect_to toys_path
      end
    end
  end
end
