require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  let(:valid_attributes) {
    (build :message).attributes.delete_if do |k,v|
      %w[ id created_at updated_at deleted_at ].member? k
    end
  }

  let(:invalid_attributes) {{ text: '' }}

  describe "GET #index" do
    it "returns a success response" do
      message = Message.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      message = Message.create! valid_attributes
      get :show, params: { id: message.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      expect{ get :edit, params: { id: message.to_param }}.to raise_exception
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, params: { message: valid_attributes }
        }.to change(Message, :count).by(1)
      end

      it "redirects to the created message" do
        post :create, params: { message: valid_attributes }
        expect(response).to redirect_to(Message.last)
      end
    end

    context "with invalid params" do
      context "without require permitted_param" do
        it "raises ActionController::ParameterMissing" do
          expect{
            post :create, params: { message: {}}
          }.to raise_exception ActionController::ParameterMissing
        end
      end

      context "with invalid model"
        it "returns success to render 'new'" do
          post :create, params: { message: invalid_attributes }
          expect(response).to be_success
        end

    end
  end
end
