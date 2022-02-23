class DefectDetail < ApplicationRecord
    belongs_to :jobinfo
    validates_presence_of  :defects, :recommendation
end
    