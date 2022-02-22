class DefectDetail < ApplicationRecord
    belongs_to :jobinfo
    has_many :jobinfo, :primary_key => :id , :foreigh_key => :jobinfo_id, :through=> :jobinfo
    validates_presence_of  :defects, :jobinfo_id, :recommendation
end
