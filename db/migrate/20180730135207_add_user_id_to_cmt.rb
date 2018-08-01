class AddUserIdToCmt < ActiveRecord::Migration[5.1]
  def change
    add_column :cmts, :user_id, :integer
  end
end
