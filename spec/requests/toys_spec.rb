require "rails_helper"

RSpec.describe "Toys", type: :request do
  let!(:seller) { create :seller }
  let!(:buyer)  { create :buyer }
  let(:valid_attrs) { attributes_for :teddy_bear }

  describe "login and post to toys" do
    it "accepts a teddy bear" do
      get "/sessions/new"
      expect(response).to be_successful
      post "/sessions", params: { username: seller.username, password: '' }
      expect(response).to be_redirect
      follow_redirect!
      expect(path).to eq "/toys"
      expect{
        post "/toys", params: { toy: valid_attrs }
      }.to change { Toy.count }.by(1)
      expect(response).to have_http_status :redirect
      expect(Toy.last.image_file_name).to eq 'teddy-bear.jpg'
      expect(path).to eq "/toys"
    end
  end
end
