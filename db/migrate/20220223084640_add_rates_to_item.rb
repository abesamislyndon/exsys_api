class AddRatesToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :rates, :decimal, precision: 10, scale: 2
  end
end
