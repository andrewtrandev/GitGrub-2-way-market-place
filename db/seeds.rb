# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


for i in 1..5
    #making a variable that we can assign the User creations to
    user=User.create(
        email: "#{i}@test.com",
        password: "123456"
    )

    #we can then create lunches on those users
    user.lunches.create(
        name:Faker::Food.dish,
        description:Faker::Food.description,
        price:Faker::Number.between(from: 1, to: 10),
        street:Faker::Address.street_name,
        suburb:Faker::Address.city, 
        state:Faker::Address.state,
        postcode:Faker::Number.between(from:1000, to:9999)
    )
    puts "created #{i} users"
end


# for i in 1..5
#     Lunch.create(
#         name:Faker::Food.dish,
#         description:Faker::Food.description,
#         price:Faker::Number.between(from: 1, to: 10),
#         user_id: 1
#     )
#     puts "created #{i} foods"
# end