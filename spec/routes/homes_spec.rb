require 'rails_helper'

RSpec.describe "routing to homes", type: :routing do
  it "routes root to homes#show" do
    root_route = { controller: 'homes', action: 'show', name: 'welcome' }
    expect(get: '/').to route_to root_route
  end
end
