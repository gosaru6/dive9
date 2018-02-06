20.times do |n|
  password = "password"
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email,
               password: password,
               password_confirmation: password,
              )
end

20.times do |note|
  user_id =  rand(2..20)
  Blog.create!(title: Faker::Vehicle.vin,
               content: Faker::Vehicle.manufacture,
               user_id: user_id,
              )
end
