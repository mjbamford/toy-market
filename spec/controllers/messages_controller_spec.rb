require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:valid_attributes) {
    (build :message).attributes.delete_if do |k,v|
      %w[ id created_at updated_at deleted_at ].member? k
    end
  }

  let(:invalid_attributes) {{ text: '' }}

  let(:valid_session) {{ user_id: (create :seller).id }}

  describe "GET #index" do
    it "returns a success response" do
      message = Message.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      message = Message.create! valid_attributes
      get :show, params: { id: message.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "rails an error since we're not allowed to edit messages" do
      expect{
        get :edit, params: { id: message.to_param }, session: valid_session
      }.to raise_exception NameError
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, params: { message: valid_attributes }, session: valid_session
        }.to change(Message, :count).by(1)
      end

      it "redirects to the created message" do
        post :create, params: { message: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Message.last)
      end
    end

    context "with invalid params" do
      context "without require permitted_param" do
        it "raises ActionController::ParameterMissing" do
          expect{
            post :create, params: { message: {}}, session: valid_session
          }.to raise_exception ActionController::ParameterMissing
        end
      end

      context "with invalid model" do
        it "returns success to render 'new'" do
          post :create, params: { message: invalid_attributes }, session: valid_session
          expect(response).to be_success
        end
      end
    end
  end
end
