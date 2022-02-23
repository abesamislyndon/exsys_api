FactoryBot.define do
  factory :partsreplace do
    association :jobinfo
    sorcode { "MyString" }
    quantity { 1 }
    item { "MyString" }
    rates { "9.99" }
    subtotal { "9.99" }
  end
end
