FactoryBot.define do
  factory :user do
      username {'giselle'}
      password {Faker::Internet.password}
      email {Faker::Internet.email}
  end
end
