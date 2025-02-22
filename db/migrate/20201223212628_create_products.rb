class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :image
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
