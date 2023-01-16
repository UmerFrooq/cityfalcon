json.array!(@prices) do |price|
  json.date price.close_date
  json.close price.close
  json.open price.open
  json.high price.high
  json.low price.low
  json.volume price.volume
end