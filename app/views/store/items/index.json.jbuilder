json.array!(@store_items) do |store_item|
  json.extract! store_item, 
  json.url store_item_url(store_item, format: :json)
end
