require "rails_helper"

RSpec.describe HomesHelper, type: :helper do
  it "responds to #current_user" do
    expect(helper).to respond_to :current_user
  end
end
