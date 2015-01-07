json.array!(@instances) do |instance|
  json.extract! instance, :id, :app_id, :name, :description, :parameters, :tags
  json.url instance_url(instance, format: :json)
end
