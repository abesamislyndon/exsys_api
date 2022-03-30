#5.times do
##    Division.create(client_id: Faker::Number.between(from: 1, to: 102), div_name: Faker::Name.name, div_short: Faker::Config.random = Random.new(3) )
#end


#dondon = User.create(username: 'dondon', email: 'abesamislyndon@gmail.com', password: 'dondon', password_confirmation: 'dondon', role: 1)

job = Jobinfo.create(
        client_name: "Bishan-Toa Payoh",
        client_id: null,
        division_name: "Block 12",
        block: "asd",
        dateEntry: "30-03-2022",
        natureofcomplain: "asd",
        address: "asd",
        gtotal: "9.0",
        status: 0
    
    )