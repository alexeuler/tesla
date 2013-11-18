class CreateStoreLeads < ActiveRecord::Migration
  def change
    create_table :store_leads do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.text :comments
      t.integer :quantity
      t.string :color
      t.string :size
      t.string :aux
      t.integer :item_id

      t.timestamps
    end
  end
end
