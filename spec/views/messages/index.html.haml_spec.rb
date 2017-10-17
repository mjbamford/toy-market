require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  let(:seller) { create :seller }
  let(:buyer)  { create :buyer }

  before :each do
    assign :messages, [
      (create :message, sender: buyer,  recipient: seller, text: 'text'),
      (create :message, sender: seller, recipient: buyer,  text: 'text')
    ]
  end

  it "renders a list of messages" do
    allow(view).to receive(:current_user).and_return seller
    render
    assert_select "tr>td", text: "text", count: 2
  end
end
