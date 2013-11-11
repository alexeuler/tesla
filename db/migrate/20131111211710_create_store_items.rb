class CreateStoreItems < ActiveRecord::Migration
  def change
    create_table :store_items do |t|

      t.timestamps
    end
  end
end
