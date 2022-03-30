class UserSerializer < ActiveModel::Serializer
  attributes  :id, :username,  :email, :role, :password, :password_confirmation
end
