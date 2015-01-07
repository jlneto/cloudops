json.array!(@instance_components) do |instance_component|
  json.extract! instance_component, :id, :instance_id, :app_component_id, :name, :template, :arn, :address
  json.url instance_component_url(instance_component, format: :json)
end
