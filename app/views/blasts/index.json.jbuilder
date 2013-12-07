json.array!(@blasts) do |blast|
  json.extract! blast, :content, :picture
  json.url blast_url(blast, format: :json)
end
