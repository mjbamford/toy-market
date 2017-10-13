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
    it 'creates a new toy' do
      toy_attrs = attributes_for :toy
      expect{ post :create, params: toy_attrs }.to change{ Toy.count }.by(1)
    end
  end
end
