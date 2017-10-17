require 'rails_helper'

RSpec.describe ToysController, type: :routing do
  it 'routes /toys to toys#index' do
    expect(get: '/toys').to route_to 'toys#index'
  end

  it 'routes /toys/new to toys#new' do
    expect(get: '/toys/new').to route_to 'toys#new'
  end

  it 'routes /toys/1' do
    expect(get: '/toys/1').to route_to "toys#show", id: '1'
  end
end
