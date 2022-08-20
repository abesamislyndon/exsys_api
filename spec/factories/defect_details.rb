FactoryBot.define do
  factory :defect_detail do
    association :jobinfo
    jobinfo_id {1}
    defects { "MyString" }
    recommendation { "MyString" }
  end
end
