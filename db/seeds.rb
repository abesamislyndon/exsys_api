5.times do
    Division.create(client_id: Faker::Number.between(from: 1, to: 102), div_name: Faker::Name.name, div_short: Faker::Config.random = Random.new(3) )
end


User.create(username: 'lyndon', email: 'abesamislyndon@gmail.com', password: 'dondon', password_confirmation: 'dondon', role: 1)