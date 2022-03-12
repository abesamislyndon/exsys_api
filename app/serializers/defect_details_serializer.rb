class DefectDetailsSerializer < ActiveModel::Serializer
  attributes :id, :jobinfo_id, :defects, :recommendation, photos:[]
end 
