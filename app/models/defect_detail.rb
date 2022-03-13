class DefectDetail < ApplicationRecord
    include ActiveModel::Serializers::JSON
    belongs_to :jobinfo
    has_one_attached :photo
  #has_many_base64_attached :photos
    validates_presence_of  :defects, :recommendation

    def photo
      return unless object.photo.attached?
  
      object.photo.blob.attributes
            .slice('filename', 'byte_size')
            .merge(url: photo_url)
            .tap { |attrs| attrs['name'] = attrs.delete('filename') }
    end
  
    def photo_url
      url_for(object.photo)
    end

end





    