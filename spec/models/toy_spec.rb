require 'rails_helper'

RSpec.describe Toy, type: :model do
  it "should have a name" do
    toy = build :toy
    expect(toy).to be_valid
    toy.name = nil
    expect(toy).not_to be_valid
  end

  it "should have a price over 10.00" do
    toy = build :toy, price: 0.00
    expect(toy).not_to be_valid
  end
end
