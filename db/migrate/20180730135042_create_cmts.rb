class CreateCmts < ActiveRecord::Migration[5.1]
  def change
    create_table :cmts do |t|
      t.string :content

      t.timestamps
    end
  end
end
