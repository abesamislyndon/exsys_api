class DefectDetailsSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :uid, :defects, :recommendation
  def uid
    object.id
  end

end
