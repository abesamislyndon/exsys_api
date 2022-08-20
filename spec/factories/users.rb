FactoryBot.define do
  factory :user do
      username {'admin'}
      password {Faker::Internet.password}
      email {Faker::Internet.email}
  end
end
