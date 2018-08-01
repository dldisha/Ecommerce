class AddImageToSellers < ActiveRecord::Migration[5.1]
  def change
    add_column :sellers, :image, :string
  end
end
