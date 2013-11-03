json.array!(@activities) do |activity|
  json.extract! activity, :name, :option1, :option2, :option3
  json.url activity_url(activity, format: :json)
end
