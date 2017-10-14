require 'rails_helper'

RSpec.describe 'toys/_toy', type: :view do
  let!(:toy) { create :toy }

  it "matches 'Toys'" do
    render 'toys/toy', toy: toy
    assert_select 'div[id=?]', (dom_id toy)
  end
end
