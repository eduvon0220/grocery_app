class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.string :location
      t.decimal :quantity
      t.string :brand
      t.integer :list_id

      t.timestamps
    end
  end
end
