class Api::V1::Activestorage::DirectUploadsController < ActiveStorage::DirectUploadsController
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  
    def create
      blob = ActiveStorage::Blob.create_before_direct_upload!(**blob_args)
    #        ActiveStorage::Attachment.create_or_find_by!(
     #        name: 'file',
    #         record_type: 'DefectDetail',
    #       record_id: blob.id,
   #       blob_id: blob.id
   # )

      render json: direct_upload_json(blob)
    end
  
    private
      def blob_args
        params.require(:blob).permit(:filename, :byte_size, :checksum, :content_type, metadata: {}).to_h.symbolize_keys
      end
  
      def direct_upload_json(blob)
        blob.as_json(root: false, methods: :signed_id).merge(direct_upload: {
          url: blob.service_url_for_direct_upload,
          headers: blob.service_headers_for_direct_upload
        })
      end
end     