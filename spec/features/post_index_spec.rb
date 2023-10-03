require 'rails_helper'

RSpec.feature 'Post Index Page' do
  let(:user) do
    User.create(name: 'Tester', photo: 'url1', bio: 'Bio 1', posts_counter: 0).tap do |u|
      u.posts.create(title: 'Post 1', text: 'Text 1')
      u.posts.first.comments.create(user_id: u.id, text: 'Comment 1')
      u.posts.first.likes.create(user_id: u.id)
    end
  end

  before do
    visit user_posts_path(user)
  end

  scenario 'displaying post information' do
    expect(page).to have_css("img[src*='#{user.photo}']")
    expect(page).to have_content('Tester')
    expect(page).to have_content('Number of posts: 1')
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Text 1')
    expect(page).to have_content('Comment 1')
    expect(page).to have_content('Comments: 1')
    expect(page).to have_content('Likes: 1')
  end

  scenario 'redirecting to post show page' do
    post = user.posts.first
    visit user_posts_path(user)
    click_link "Post #{post.id}"
    expect(current_path).to eq(user_post_path(user, user.posts.first))
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.text)
  end
end
