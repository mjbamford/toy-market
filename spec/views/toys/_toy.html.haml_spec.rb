require 'rails_helper'

RSpec.describe 'toys/_toy', type: :view do
  let!(:toy) { create :toy }
  let(:seller) { create :seller }

  it "matches 'Toys'" do
    without_partial_double_verification do
      allow(view).to receive(:current_user).and_return seller
      render 'toys/toy', toy: toy
      assert_select 'div[id=?]', (dom_id toy)
    end
  end
end
