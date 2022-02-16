require 'rails_helper'

RSpec.describe Division, type: :model do

context "validations" do
   it { should validate_presence_of(:div_short) }
   it { should validate_presence_of(:div_name) }
   it { should validate_presence_of(:client_id)}
end

context "associations" do
   it { should have_many(:clients)}
end

#context "accepts nested attribute" do
#   it { should accept_nested_attributes_for :clients}
#end
end
