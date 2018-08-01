class AddCategoryToSeller < ActiveRecord::Migration[5.1]
  def change
    add_column :sellers, :category, :string
  end
end
