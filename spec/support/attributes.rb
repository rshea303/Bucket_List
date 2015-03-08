def user_attributes(overrides = {})
  {
    name: "username",
    email: "user@example.com",
    password: "password"
  }.merge(overrides)
end
