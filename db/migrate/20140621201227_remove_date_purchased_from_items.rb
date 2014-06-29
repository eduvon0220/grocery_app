class RemoveDatePurchasedFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :date_purchased, :date
  end
end
