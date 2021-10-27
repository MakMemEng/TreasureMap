# メインのサンプルユーザーを1人作成する
User.create!(username: "Admin User",
              email: "admin0000@admin.com",
              password: "admin0000",
              admin: true)

10.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@user.com"
  password = "password"
  User.create!(username: name,
                email: email,
                password: password,
                password_confirmation: password
  )
end
