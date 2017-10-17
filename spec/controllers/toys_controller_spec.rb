require 'rails_helper'

RSpec.describe ToysController, type: :controller do
  render_views

  let(:valid_attrs) { attributes_for :toy }
  let(:invalid_attrs) {{ name: nil }}
  let(:valid_session) {{ user_id: (create :buyer).id }}

  describe "GET #index" do
    let!(:toys) { create_list :toy, 3 }

    it "shows all toys" do
      get :index, session: valid_session
      expect(response).to be_successful
      expect(response.body).to match /Toys/
      expect(assigns :toys).to match toys
    end
  end

  describe "GET #new" do
    it "shows new toy form" do
      get :new, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      toy = create :toy
      get :show, params: { id: toy.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new toy" do
        expect{
          post :create, params: { toy: valid_attrs }, session: valid_session
        }.to change{ Toy.count }.by(1)
      end

      it "redirects to the index page" do
        post :create, params: { toy: valid_attrs }, session: valid_session
        expect(response).to redirect_to toys_path
      end
    end

    context "with invalid params" do
      context "when invalid model" do
        it "returns success to render 'new'" do
          post :create, params: { toy: invalid_attrs }, session: valid_session
          expect(response).to be_successful
        end
      end

      context "when missing required permitted_param" do
        it "returns success to render 'new'" do
          post :create, params: {}, session: valid_session
          expect(response).to be_successful
        end
      end
    end
  end
end
