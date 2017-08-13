json.array!(@projs) do |proj|
  json.extract! proj, :id, :title, :string, :content
  json.url proj_url(proj, format: :json)
end
