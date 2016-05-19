json.array!(@players) do |player|
  json.extract! player, :id, :name, :age, :money
  json.url player_url(player, format: :json)
end
