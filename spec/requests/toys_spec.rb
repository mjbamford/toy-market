require 'rails_helper'

RSpec.describe 'Toys', type: :request do
  let(:valid_attrs) { attributes_for :teddy_bear }

  describe 'POST /toys' do
    it 'accepts a teddy bear' do
      post toys_path, params: { toy: valid_attrs }
      expect(response).to have_http_status :redirect
      expect(Toy.last.image_file_name).to eq 'teddy-bear.jpg'
    end
  end
end
