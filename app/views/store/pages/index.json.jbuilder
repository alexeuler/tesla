json.array!(@store_pages) do |store_page|
  json.extract! store_page, 
  json.url store_page_url(store_page, format: :json)
end
