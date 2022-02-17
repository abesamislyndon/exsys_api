class CreateDefectDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :defect_details do |t|
      t.integer :jobinfo_id
      t.string :defects
      t.string :recommendation

      t.timestamps
    end
  end
end
