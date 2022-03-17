class  Api::V1::UploadController < ActiveStorage::DiskController

  
  def update
    if token = decode_verified_token
      if acceptable_content?(token)
        named_disk_service(token[:service_name]).upload token[:key], request.body, checksum: token[:checksum]
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  rescue ActiveStorage::IntegrityError
    head :unprocessable_entity
  end

  end