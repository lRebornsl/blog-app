require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Andrea', posts_counter: 0) }

  subject { described_class.new(title: 'Test', author: user) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a title exceeding 250 characters' do
    subject.title = 'A' * 251
    expect(subject).to_not be_valid
  end

  it 'is valid with a title of 250 characters or less' do
    subject.title = 'A' * 250
    expect(subject).to be_valid
  end

  describe '#recent_comments' do
    it 'returns the 5 most recent comments for the post' do
      post = subject
      comment1 = Comment.create(user: user, post: post, text: 'Comment 1')
      comment2 = Comment.create(user: user, post: post, text: 'Comment 2')
      comment3 = Comment.create(user: user, post: post, text: 'Comment 3')

      # Ensure the comments are in descending order of creation (most recent first)
      expect(post.recent_comments).to eq([comment3, comment2, comment1])
    end

    it 'returns an empty array when there are no comments' do
      expect(subject.recent_comments).to be_empty
    end
  end
  
  describe '#update_post_counter' do
    it 'updates the post counter for the author' do
      post = subject
      expect { post.save }.to change { user.reload.posts_counter }.by(1)
    end
  end
end