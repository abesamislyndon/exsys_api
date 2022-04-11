class DefectDetailsSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :uid, :defects, :recommendation, :photo_url
  def uid
    object.id
  end

  def photo_url
    if object.defectphoto.present?
      rails_blob_path(object.defectphoto, only_path: true)
    end
  end

end
