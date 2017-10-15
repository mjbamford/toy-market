require 'rails_helper'

RSpec.describe 'Toys', type: :request do
  let(:seller) { create :seller }
  let(:valid_attrs) { (attributes_for :teddy_bear).merge seller_id: seller.id }

  describe 'POST /toys' do
    it 'accepts a teddy bear' do
      post toys_path, params: { toy: valid_attrs }
      expect(response).to have_http_status :redirect
      expect(Toy.last.image_file_name).to eq 'teddy-bear.jpg'
    end
  end
end
