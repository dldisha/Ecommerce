class AddWarrantyToSeller < ActiveRecord::Migration[5.1]
  def change
    add_column :sellers, :warranty, :string
  end
end
