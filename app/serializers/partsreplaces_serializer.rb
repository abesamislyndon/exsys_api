class PartsreplacesSerializer < ActiveModel::Serializer
  attributes :id, :uid, :jobinfo_id, :sorcode, :item, :quantity, :rates, :subtotal

  def uid
    object.id
  end
end
