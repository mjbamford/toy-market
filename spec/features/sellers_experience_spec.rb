require "rails_helper"

RSpec.feature "Seller's experience" do
  let(:seller) { create :seller }

  scenario "login and see toys" do
    visit "/"
    click_link "Log In"
    expect(page).to have_text "Login"

    fill_in "username", with: seller.username
    click_button "Log In"
    expect(page).to have_current_path "/toys"
  end
end
