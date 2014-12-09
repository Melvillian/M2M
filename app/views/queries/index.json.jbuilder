json.array!(@queries) do |query|
  json.extract! query, :id, :file_name, :file_size_bytes, :path_id, :share_id, :server_id
  json.url query_url(query, format: :json)
end
