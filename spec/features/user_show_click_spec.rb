require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  let(:user) { User.create(name: 'Test', posts_counter: 0) }

  scenario 'When I click a user\'s post, it redirects me to that post\'s show page' do
    post = Post.create(author_id: user.id, title: 'Test', text: 'This is my first test')
    visit user_posts_path(user)
    click_link "Post #{post.id}"
    expect(current_path).to eq(user_post_path(user, post))
  end

  scenario 'When I click to see all posts, it redirects me to the user\'s post\'s index page' do
    visit user_path(user)
    click_link 'See all posts'
    expect(current_path).to eq(user_posts_path(user))
  end
end
