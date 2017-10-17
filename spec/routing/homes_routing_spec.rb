require 'rails_helper'

RSpec.describe "routing to homes", type: :routing do
  it "routes root to homes#show" do
    expect(get: '/').to route_to 'homes#show', name: 'welcome'
  end
end
