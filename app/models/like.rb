class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_like_counter
    post.update(likes_counter: post.likes.count)
  end
end
