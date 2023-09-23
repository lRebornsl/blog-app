require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Andrea', posts_counter: 0) }
  let(:post) { Post.create(title: 'Test') }

  subject { described_class.new(comments_counter: 0, user: user, post: post) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid with a negative comments_counter' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'is valid with a positive comments_counter' do
    subject.comments_counter = 1
    expect(subject).to be_valid
  end

  # Add tests for the update_comment_counter method
  describe '#update_comment_counter' do
    it 'updates the comment counter for the post' do
      # Create a user
      user = User.create(name: 'Andrea', posts_counter: 0)

      # Create a post
      post = Post.create(title: 'Test', author: user)

      # Create a comment associated with the post
      comment = Comment.new(user: user, post: post)

      expect { comment.save }.to change { post.reload.comments_counter }.by(1)
    end
  end
end