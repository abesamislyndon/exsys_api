FactoryBot.define do
  factory :defect_detail do
    association :jobinfo
    defects { "MyString" }
    recommendation { "MyString" }
  end
end
