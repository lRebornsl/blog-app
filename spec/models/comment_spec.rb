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

  describe '#update_comment_counter' do
    it 'updates the comment counter for the post' do
      user = User.create(name: 'Andrea', posts_counter: 0)
      post = Post.create(title: 'Test', author: user)
      comment = Comment.new(user: user, post: post)
      expect { comment.save }.to change { post.reload.comments_counter }.by(1)
    end
  end
end