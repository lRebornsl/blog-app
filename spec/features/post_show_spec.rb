require 'rails_helper'

RSpec.feature 'Post Show Page' do
  let(:user) do
    User.create(name: 'Tester', photo: 'url1', bio: 'Bio 1', posts_counter: 0).tap do |u|
      u.posts.create(title: 'Post 1', text: 'Text 1')
      u.posts.first.comments.create(user_id: u.id, text: 'Comment 1')
      u.posts.first.likes.create(user_id: u.id)
    end
  end

  before do
    visit user_post_path(user, user.posts.first)
  end

  scenario 'displaying post and comments information' do
    expect(page).to have_content("Post ##{user.posts.first.id}")
    expect(page).to have_content(user.name)
    expect(page).to have_content('Comments: 1')
    expect(page).to have_content('Likes: 1')
    expect(page).to have_content('Text 1')
    expect(page).to have_content("#{user.name}: Comment 1")
  end
end