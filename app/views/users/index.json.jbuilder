json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :password_digest, :rank
  json.url user_url(user, format: :json)
end
