require 'rails_helper'

RSpec.describe 'toys/index', type: :view do
  it "matches 'Toys'" do
    render
    expect(rendered).to match /Toys/
  end

  it 'renders @toys collection' do
    assign :toys, (toys = create_list :toy, 3)
    render
    toys.each do |toy|
      expect(rendered).to match "toy_#{toy.id}"
    end
  end
end
