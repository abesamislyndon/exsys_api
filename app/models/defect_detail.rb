class DefectDetail < ApplicationRecord  
    
    has_one_attached :defectphoto 
    belongs_to :jobinfo 
    validates_presence_of  :defects, :recommendation
end





    