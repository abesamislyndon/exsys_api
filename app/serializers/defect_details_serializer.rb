class DefectDetailsSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :uid, :defects, :recommendation, :photo_url
  def uid
    object.id
  end

  

  def photo_url
    if object.photo.present?
      rails_blob_path(object.photo, only_path: true)
    end
  end

end
