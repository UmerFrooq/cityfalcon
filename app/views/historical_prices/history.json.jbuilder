json.array!(@prices) do |price|
  json.close_time price.close_time
  json.close price.close.to_f
  json.volume price.volume
end