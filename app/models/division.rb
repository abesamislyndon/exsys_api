class Division < ApplicationRecord
  validates_presence_of :div_name, :div_short, :client_id
  has_many :clients, foreign_key: 'id', primary_key: 'client_id'

  def self.client_division(id)
    sql = "SELECT
            divisions.id, div_name, client_id
            from  divisions
            JOIN clients ON clients.id = divisions.client_id
            where clients.id = #{id}"
   result =  ActiveRecord::Base.connection.exec_query(sql)
  end
end
