class AddRouteToItem < ActiveRecord::Migration
  def change
    add_column :store_items, :route, :string
  end
end
