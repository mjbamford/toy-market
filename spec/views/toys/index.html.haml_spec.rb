require 'rails_helper'

RSpec.describe 'toys/index', type: :view do
  let(:seller) { create :seller }

  it 'renders @toys collection' do
    assign :toys, (toys = create_list :toy, 3)
    allow(view).to receive(:current_user).and_return seller
    render
    toys.each do |toy|
      expect(rendered).to match "toy_#{toy.id}"
    end
  end
end
