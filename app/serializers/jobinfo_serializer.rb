class JobinfoSerializer < ActiveModel::Serializer
  attributes  :id , 
              :client_name,
              :client_id,
              :division_name,
              :block, 
              :dateEntry, 
              :natureofcomplain,
              :address,
              :gtotal,
              :status,
              :defect_details,
              :partsreplaces

        
              def defects
                ActiveModel::SerializableResource.new(object.defect_details,  each_serializer: DefectDetailSerializer)
              end
            




end
