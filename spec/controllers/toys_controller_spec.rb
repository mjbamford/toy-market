require 'rails_helper'

RSpec.describe ToysController, type: :controller do
  render_views

  describe 'GET #index' do
    let!(:toys) { create_list :toy, 3 }

    it 'shows all toys' do
      get :index
      expect(response).to be_successful
      expect(response.body).to match /Toys/
      expect(assigns :toys).to match toys
    end
  end

  describe "GET #new" do
    it 'shows new toy form' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_attrs) {{ toy: attributes_for(:toy) }}
    let(:invalid_attrs) {{ toy: { name: nil }}}

    context 'with valid params' do
      it 'creates a new toy' do
        expect{
          post :create, params: valid_attrs
        }.to change{ Toy.count }.by(1)
      end

      it 'redirects to the index page' do
        post :create, params: valid_attrs
        expect(response).to redirect_to toys_path
      end
    end

    context "with invalid params" do
      context "when model rejects attrs" do
        it "returns success to render 'new'" do
          post :create, params: invalid_attrs
          expect(response).to be_successful
        end
      end

      context "when toy param missing" do
        it "returns success to render 'new'" do
          post :create, params: {}
          expect(response).to be_successful
        end
      end
    end
  end
end
