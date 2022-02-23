class Partsreplace < ApplicationRecord
     belongs_to :jobinfo
     validates_presence_of :sorcode, :item, :quantity, :rates, :subtotal
end
