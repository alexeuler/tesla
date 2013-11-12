class Store::Item < ActiveRecord::Base
  has_many :store_pages
end
