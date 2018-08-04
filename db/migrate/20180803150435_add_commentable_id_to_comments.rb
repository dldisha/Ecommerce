class AddCommentableIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :commentable_id, :integer
  end
end
