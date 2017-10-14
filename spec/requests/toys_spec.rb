require 'rails_helper'

RSpec.describe 'Toys', type: :request do
  describe 'POST /toys' do
    it 'accepts a teddy bear' do
      attrs = attributes_for :teddy_bear
      post toys_path, params: { toy: attrs }
      expect(response).to have_http_status :redirect
      expect(Toy.last.image_file_name).to eq 'teddy-bear.jpg'
    end
  end
end
