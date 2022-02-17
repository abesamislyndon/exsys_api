require 'rails_helper'

RSpec.describe DefectDetail, type: :model do

  before(:all) do
    @defect_details = FactoryBot.create(:defect_detail)
  end


  context "validations" do
     [:jobinfo_id, :defects,:recommendation].each do |defects_recommendation|
        it { should validate_presence_of(defects_recommendation)}
     end
  end


end
