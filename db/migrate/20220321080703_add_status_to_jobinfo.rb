class AddStatusToJobinfo < ActiveRecord::Migration[6.0]
  def change
    add_column :jobinfos, :status, :integer
  end
end
