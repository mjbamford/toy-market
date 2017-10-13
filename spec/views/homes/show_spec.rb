require 'rails_helper'

RSpec.describe 'homes/show', type: :view do
  let(:welcome_home) { double name: 'welcome' }

  it "matches 'welcome'" do
    assign :home, welcome_home
    render
    expect(rendered).to match /welcome/i
  end
end
