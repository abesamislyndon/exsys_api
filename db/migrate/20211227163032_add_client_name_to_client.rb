class AddClientNameToClient < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :client_name, :string
  end
end
