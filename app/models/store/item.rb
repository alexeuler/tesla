class Store::Item < ActiveRecord::Base
  has_many :store_pages, class_name: "Store::Page", foreign_key: "store_item_id"
  extend FriendlyId
  friendly_id :route, use: [:finders]
end
