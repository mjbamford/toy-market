require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :sender => (create :user),
      :recipient => (build :user),
      :text => "MyText"
    ))
  end

  it "renders new message form" do
    render
    assert_select "form[action=?][method=?]", messages_path, "post" do
      # assert_select "input[name=?]", "message[recipient_id]"
      assert_select "textarea[name=?]", "message[text]"
    end
  end
end
