require 'rails_helper'

RSpec.describe 'toys/index', type: :view do
  let(:seller) { create :seller }

  it 'render link to new toy' do
    render
    expect(rendered).to match "New Toy"
    assert_select "a[href=?]", new_toy_path
  end

  it 'renders @toys collection' do
    assign :toys, (toys = create_list :toy, 3)
    allow(view).to receive(:current_user).and_return seller
    render
    toys.each do |toy|
      expect(rendered).to match "toy_#{toy.id}"
    end
  end
end
