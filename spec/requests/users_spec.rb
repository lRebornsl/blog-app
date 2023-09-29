require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('All users')
      # Replace 'Placeholder text for users#index' with the actual placeholder text.
    end
  end

  describe 'GET #show' do
    let(:user) { { id: 2 } }

    it 'returns a successful response' do
      get user_path(user)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_path(user)
      expect(response.body).to include('User details')
      # Replace 'Placeholder text for users#show' with the actual placeholder text.
    end
  end
end
