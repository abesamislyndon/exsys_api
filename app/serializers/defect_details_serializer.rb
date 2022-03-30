class DefectDetailsSerializer < ActiveModel::Serializer
  attributes :id, :uid, :defects, :recommendation, :photo

  def uid
    object.id
  end

  def photo
    rails_blob_path(object.photo, only_path: true) if object.photo.attached?
  end

  #def photo
  #  return unless object.photo.attached?

   # object.photo.blob.attributes
   #       .slice('filename', 'byte_size')
   #       .merge(url: image_url)
   #       .tap { |attrs| attrs['name'] = attrs.delete('filename') }
   #end

  #def image_url
  ##  url_for(object.photo)
  #end


end
