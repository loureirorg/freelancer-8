json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :message
  json.url post_url(post, format: :json)
end
