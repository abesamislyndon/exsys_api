class Jobinfo < ApplicationRecord
  has_many :defect_details, dependent: :destroy
  has_many :partsreplace, dependent: :destroy
  accepts_nested_attributes_for :defect_details, allow_destroy: true
  accepts_nested_attributes_for :partsreplace, allow_destroy: true
  validates_presence_of  :client_name, :division_name, :block, :address, :natureofcomplain, :dateEntry
end
 