class Store::Page < ActiveRecord::Base
  belongs_to :store_item
end
