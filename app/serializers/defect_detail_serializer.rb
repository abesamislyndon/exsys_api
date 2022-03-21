class DefectDetailSerializer < ActiveModel::Serializer
  attributes :id, :defects, :recommendation, :photo


  def photo
     d = "asd"
    #return url_for(object.photo) if object.photo.attached?
    return rails_blob_path(object.photo, only_path: true) if object.photo.attached?
  end

end
