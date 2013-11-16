class Store::Page < ActiveRecord::Base
  belongs_to :store_item, class_name: "Store::Item", foreign_key: "store_item_id"
  extend FriendlyId
  friendly_id :route, use: [:finders]
end
