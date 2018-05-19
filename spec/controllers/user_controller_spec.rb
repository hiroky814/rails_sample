require 'rails_helper'

RSpec.describe UserController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #read' do
    it 'all search' do
      get :read, params: {
          name: ''
      }
      expect(response).to have_http_status(:success)
    end

    it 'exsist name' do
        get :read, params: {
            name: '山田'
        }
        expect(response).to have_http_status(:success)
    end
  end
end
