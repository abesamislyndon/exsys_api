class Jobinfo < ApplicationRecord
  has_many :defect_details, dependent: :destroy ,  inverse_of: :jobinfo
  has_many :partsreplace, dependent: :destroy, inverse_of: :jobinfo
  accepts_nested_attributes_for :defect_details, allow_destroy: true ,  reject_if: :all_blank
  accepts_nested_attributes_for :partsreplace, allow_destroy: true,   reject_if: :all_blank 
  validates_presence_of  :client_name, :division_name, :block, :address, :natureofcomplain, :dateEntry
end
 