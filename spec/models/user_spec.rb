require 'rails_helper'

RSpec.describe User, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"

 context 'validations' do
     it { should validate_presence_of(:username)}
 end


end
