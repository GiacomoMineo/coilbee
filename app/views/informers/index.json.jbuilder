json.array!(@informers) do |informer|
  json.extract! informer, :id, :email
  json.url informer_url(informer, format: :json)
end
