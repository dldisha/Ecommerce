class AddUserIdToSellers < ActiveRecord::Migration[5.1]
  def change
    add_column :sellers, :user_id, :integer
  end
end
