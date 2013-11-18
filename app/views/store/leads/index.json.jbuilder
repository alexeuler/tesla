json.array!(@store_leads) do |store_lead|
  json.extract! store_lead, :name, :phone, :email, :address, :comments, :quantity, :color, :size, :aux, :item_id
  json.url store_lead_url(store_lead, format: :json)
end
