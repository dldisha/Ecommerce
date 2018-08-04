class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.string :user_id
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
