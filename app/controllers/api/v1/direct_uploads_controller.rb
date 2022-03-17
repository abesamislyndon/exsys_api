class Api::V1::DirectUploadsController < ActiveStorage::DirectUploadsController
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
    def create
      blob = ActiveStorage::Blob.create_before_direct_upload!(**blob_args)
  
    # Attach the blob to the project by creating the association in the database directly.
    ActiveStorage::Attachment.create(
        name: blob.filename,
        record_type: "DefectDetail" ,
        record_id: blob.id,
        blob_id: blob.id
    )
    
    render json: direct_upload_json(blob)
    end

    private

    def direct_upload_json(blob)
        blob.as_json(root: false, methods: :signed_id).merge(service_url: url_for(blob)).merge(direct_upload:{
            url: blob.service_url_for_direct_upload,
        headers: blob.service_headers_for_direct_upload
      })
    end
end     