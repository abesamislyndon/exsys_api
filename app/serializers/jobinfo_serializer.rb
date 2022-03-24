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
              #:defects,
              #:partsreplaces
              :partsreplaces

              def defects
                ActiveModel::SerializableResource.new(object.defect_details,  each_serializer: DefectDetailSerializer)
              end

              def partsreplaces
                ActiveModel::SerializableResource.new(object.partsreplaces,  each_serializer: PartsreplacesSerializer)
              end
            
end
