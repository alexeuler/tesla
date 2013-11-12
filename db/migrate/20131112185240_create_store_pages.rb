class CreateStorePages < ActiveRecord::Migration
  def change
    create_table :store_pages do |t|

      t.timestamps
    end
  end
end
