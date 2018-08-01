class CreateSellers < ActiveRecord::Migration[5.1]
  def change
    create_table :sellers do |t|
      t.string :type
      t.string :brand
      t.string :model
      t.text :description
      t.string :condition
      t.integer :price , default: 0

      t.timestamps
    end
  end
end
