class AddColorToSeller < ActiveRecord::Migration[5.1]
  def change
    add_column :sellers, :color, :string
  end
end
