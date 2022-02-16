class CreateJobinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :jobinfos do |t|
      t.string :client_name
      t.string :division_name
      t.string :block
      t.string :dateEntry
      t.string :natureofcomplain

      t.timestamps
    end
  end
end
