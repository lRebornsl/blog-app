class DropForeignKeyConstraint < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :posts, column: :author_id
  end
end
