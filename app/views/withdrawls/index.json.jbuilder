json.array!(@withdrawls) do |withdrawl|
  json.extract! withdrawl, :id, :account_number, :coin, :coin_address, :pin
  json.url withdrawl_url(withdrawl, format: :json)
end
