def user_attributes(overrides = {})
  {
    name: "Roger Martinez",
    email: "roger.martinez@seleccioncolombia.com.co",
    address: "Calle 85, 53 - 14",
    phone: 3012528558,
    password: "secret",
    password_confirmation: "secret"
  }.merge(overrides)
end