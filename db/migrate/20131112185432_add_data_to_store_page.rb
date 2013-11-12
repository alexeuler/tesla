class AddDataToStorePage < ActiveRecord::Migration
  def change
    add_column :store_pages, :name, :string
    add_column :store_pages, :html, :text
    add_column :store_pages, :store_item_id, :integer
  end
end
