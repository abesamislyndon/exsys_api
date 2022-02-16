class AddAddressToJobinfos < ActiveRecord::Migration[6.0]
  def change
    add_column :jobinfos, :address, :string
  end
end
