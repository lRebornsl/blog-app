class ChangeUserIdToAuthorIdInPosts < ActiveRecord::Migration[7.0]
  def up
    rename_column :posts, :user_id, :author_id
    add_foreign_key :posts, :users, column: :author_id
  end

  def down
    remove_foreign_key :posts, column: :author_id
    rename_column :posts, :author_id, :user_id
  end
end
