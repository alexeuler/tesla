class Store::Item < ActiveRecord::Base
  has_many :store_pages, class_name: "Store::Page", foreign_key: "store_item_id"
end
