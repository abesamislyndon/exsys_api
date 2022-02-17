require 'rails_helper'

RSpec.describe Jobinfo, type: :model do
  
  before(:all) do
    @jobinfo = FactoryBot.create(:jobinfo)
  end

  context "validations" do
    [:client_name, :division_name, :block, :dateEntry, :natureofcomplain, :address].each do |jobinfo| 
      it { should validate_presence_of(jobinfo)}
    end
  end

  context "CRUD" do
      it 'check jobinfo can be created' do
        expect(@jobinfo).to be_valid
      end

      it 'check jobinfo can be update' do
        [:client_name=>"cdo", :division_name=>"bayabas", :block=>"12", :dateEntry=>"12-12-22", :natureofcomplain=>"learning", :address=>"adelaida"].each do |jobinfo|  
          @jobinfo.update(jobinfo)
          expect(Jobinfo.find_by_client_name('cdo')).to eq(@jobinfo)
        end
      end

      it 'check if can be delete' do
          @jobinfo.destroy
          expect(Jobinfo.find_by_client_name('cdo')).to eq(nil)
      end
  end

  context "nested atributes for defect details" do
    it { should accept_nested_attributes_for(:defect_details)}
  end

  context "nested attributes parts details" do
    it {should accept_nested_attributes_for(:partsreplace)}
end

end
