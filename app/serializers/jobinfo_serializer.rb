class JobinfoSerializer < ActiveModel::Serializer
  attributes  :id , 
              :client_name,
              :division_name,
              :block, 
              :dateEntry, 
              :natureofcomplain,
              :address,
              :gtotal,
              :defect_details,
              :partsreplaces
end
