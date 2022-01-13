class CreateDivisions < ActiveRecord::Migration[6.0]
  def change
    create_table :divisions do |t|
      t.integer :client_id
      t.string :div_name
      t.string :div_short

      t.timestamps
    end
  end
end
