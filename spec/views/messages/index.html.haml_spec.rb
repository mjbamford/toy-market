require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :sender => (create :user),
        :recipient => (create :user),
        :text => "MyText"
      ),
      Message.create!(
        :sender => (create :user),
        :recipient => (create :user),
        :text => "MyText"
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
