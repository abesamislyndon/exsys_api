class DefectDetailSerializer < ActiveModel::Serializer
  attributes :id, :defects, :recommendation, :photo


  def photo
    return unless object.photo.attached?

    object.photo.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: image_url)
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def image_url
    url_for(object.photo)
  end

end
