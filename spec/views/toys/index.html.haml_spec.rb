require 'rails_helper'

RSpec.describe 'toys/index', type: :view do
  let(:seller) { create :seller }

  it "renders @toys collection" do
    without_partial_double_verification do
      allow(view).to receive(:current_user).and_return seller
      assign :toys, (toys = create_list :toy, 3)
      render
      toys.each do |toy|
        expect(rendered).to match "toy_#{toy.id}"
      end
    end
  end
end
