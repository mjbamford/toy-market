require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  render_views

  describe 'GET #show' do
    it 'renders the named partial' do
      get :show, params: { name: 'welcome' }
      expect(response.body).to match /welcome/i
    end

    it 'raises RecordNotFound for an unknown home' do
      expect{ get :show, params: { name: 'noop' }}.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
