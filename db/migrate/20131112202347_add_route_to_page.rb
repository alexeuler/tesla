class AddRouteToPage < ActiveRecord::Migration
  def change
    add_column :store_pages, :route, :string
  end
end
