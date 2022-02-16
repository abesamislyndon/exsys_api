class Jobinfo < ApplicationRecord
  validates_presence_of :client_name, :division_name, :block, :address, :natureofcomplain, :dateEntry
end
 