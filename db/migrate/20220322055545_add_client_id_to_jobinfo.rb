class AddClientIdToJobinfo < ActiveRecord::Migration[6.0]
  def change
    add_column :jobinfos, :client_id, :string
  end
end
