class AddDataToItem < ActiveRecord::Migration
  def change
    add_column :store_items, :name, :string
    add_column :store_items, :group, :string
  end
end
