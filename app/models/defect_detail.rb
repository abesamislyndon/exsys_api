class DefectDetail < ApplicationRecord
    belongs_to :jobinfo 
    has_one_attached :photo 
    delegate_missing_to :photo
    validates_presence_of  :defects, :recommendation
end





    