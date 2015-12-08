json.array!(@events) do |event|
  json.extract! event, :id, :name, :date, :image_url, :description
  json.url event_url(event, format: :json)
end
