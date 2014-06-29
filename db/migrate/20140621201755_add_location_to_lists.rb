class AddLocationToLists < ActiveRecord::Migration
  def change
    add_column :lists, :location, :string
  end
end
