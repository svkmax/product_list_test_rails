class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.string :category

      t.timestamps null: false
    end

    add_index :products, :category
  end
end
