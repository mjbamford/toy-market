require 'rails_helper'

RSpec.describe ToysController, type: :controller do
  render_views

  describe "GET #index" do
    let!(:toys) { create_list :toy, 3 }

    it "shows all toys" do
      get :index
      expect(response).to be_successful
      expect(response.body).to match /Toys/
      expect(assigns :toys).to match toys
    end
  end
end
