class Partsreplace < ApplicationRecord
     belongs_to :jobinfo
     has_many :jobinfo, primary_key: :id, foreigh_key: :jobinfo_id, through: :partsreplace
     validates_presence_of :jobinfo_id, :sorcode, :item, :quantity, :rates, :subtotal
end
