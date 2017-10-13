require 'rails_helper'

RSpec.describe "routing to toys", type: :routing do
  it "routes /toys to toys#index" do
    expect(get: '/toys').to route_to 'toys#index'
  end

  it "routes /toys/new to toys#new" do
    expect(get: '/toys/new').to route_to 'toys#new'
  end
end
