class AddNameToCmt < ActiveRecord::Migration[5.1]
  def change
    add_column :cmts, :name, :string
  end
end
