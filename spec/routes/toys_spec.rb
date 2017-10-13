require 'rails_helper'

RSpec.describe "routing to toys", type: :routing do
  it "routes /toys to toys#index" do
    toys_route = { controller: 'toys', action: 'index' }
    expect(get: '/toys').to route_to toys_route
  end
end
