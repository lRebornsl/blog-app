require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get user_posts_path(user_id: 2)
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get user_posts_path(user_id: 2)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get user_posts_path(user_id: 2)
      expect(response.body).to include('All Posts')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'Andrea', posts_counter: 0) }
    let(:post) { Post.create(author_id: user.id, title: 'Test', text: 'This is my first test') }

    it 'returns a successful response' do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response.body).to include('Post details')
    end
  end
end
