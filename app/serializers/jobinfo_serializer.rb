class JobinfoSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes  :id, 
              :client_name,
              :client_id,
              :division_name,
              :block, 
              :dateEntry, 
              :natureofcomplain,
              :address,
              :gtotal,
              :status,
              :photo_url,
              :defect_details,
              #:defects,
              #:partsreplaces
              :partsreplaces

              def defect_details
                ActiveModelSerializers::SerializableResource.new(object.defect_details,  each_serializer: DefectDetailsSerializer)
              end

              def partsreplaces
                ActiveModelSerializers::SerializableResource.new(object.partsreplaces,  each_serializer: PartsreplacesSerializer)
              end
            
              def photo_url
                if object.photo.present?
                  rails_blob_path(object.photo, only_path: true)
                end
              end

end
