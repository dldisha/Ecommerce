class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :category
      t.string :brand
      t.integer :min_price
      t.integer :max_price

      t.timestamps
    end
  end
end
