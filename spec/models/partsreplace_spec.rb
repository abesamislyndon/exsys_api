require 'rails_helper'

RSpec.describe Partsreplace, type: :model do

  before(:all) do
      @partsreplace = FactoryBot.create(:partsreplace)
  end

  context "validates" do
    [:jobinfo_id, :sorcode, :quantity, :item, :rates, :subtotal].each do |parts|
       it { should validate_presence_of(parts)}
    end
  end

  context "CRUD" do
      it "can be created parts replace" do
          expect(@partsreplace).to be_valid
      end

      it "can be updated parts replace" do
        [:jobinfo_id=>12, :sorcode=>"sample123", :quantity=>12, :item=>"sample item", :rates=>2.00, :subtotal=>12.90].each do |parts|
            @partsreplace.update(parts)
            expect(Partsreplace.find_by_jobinfo_id(12)).to eq(@parts)
         end
      end

      it "can be delete" do
          @partsreplace.destroy
          expect(Partsreplace.find_by_jobinfo_id(12)).to eq(nil)
      end
    end

end
