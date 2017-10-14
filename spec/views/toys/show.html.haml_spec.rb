require 'rails_helper'

RSpec.describe 'toys/show', type: :view do
  it 'renders the toy' do
    assign :toy, (toy = create :toy)
    render
    assert_select 'div[id=?]', (dom_id toy)
  end
end

