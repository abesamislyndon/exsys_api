class AddGtotalToJoninfo < ActiveRecord::Migration[6.0]
  def change
    add_column :jobinfos, :gtotal, :decimal, precision: 10, scale: 2
  end
end
