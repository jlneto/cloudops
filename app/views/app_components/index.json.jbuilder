json.array!(@app_components) do |app_component|
  json.extract! app_component, :id, :app_id, :name, :description, :type, :template, :instructions
  json.url app_component_url(app_component, format: :json)
end
