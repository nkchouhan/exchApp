json.array!(@admin_orders) do |admin_order|
  json.extract! admin_order, :id, :status, :coin, :quantity, :odr_date, :bid_or_ask
  json.url admin_order_url(admin_order, format: :json)
end
