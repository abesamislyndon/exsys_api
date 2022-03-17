class DefectDetailsSerializer < ActiveModel::Serializer
  has_one_attached :photo
  attributes :id , :defects, :recommendation, :photo

  def photo
    url_for(object.photo) if object.photo.attached?
  end

end
