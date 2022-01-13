FactoryBot.define do
  factory :client_list, class: Client do
    client_name  { Faker::Name.unique.name }
  end
end
