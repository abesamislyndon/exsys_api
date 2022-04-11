class Api::V1::Activestorage::DirectUploadsController < ActiveStorage::DirectUploadsController
  # before_action :authenticate_user!
  #protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  #
 def create
      blob = ActiveStorage::Blob.create_before_direct_upload!(blob_args)
      render json: direct_upload_json(blob)

      

   # ActiveStorage::Attachment.create_or_find_by!(
   #   name: 'photo',
   #   record_type: 'Jobinfo',
   #   record_id: 59,
   #  blob_id: blob.id
#)
    end

  private
  ## def blob_args
  #      params.require(:blob).permit(:filename, :byte_size, :checksum, :content_type, metadata: {}).to_h.symbolize_keys
 #  end
  
   def direct_upload_json(blob)
        blob.as_json(root: false, methods: :signed_id).merge(service_url: url_for(blob)).merge(direct_upload: {
          url: blob.service_url_for_direct_upload,
         headers: blob.service_headers_for_direct_upload
        })
    end
end     