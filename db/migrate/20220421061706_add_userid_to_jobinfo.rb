class AddUseridToJobinfo < ActiveRecord::Migration[6.0]
  def change
    add_column :jobinfos, :Userid, :integer
  end
end
