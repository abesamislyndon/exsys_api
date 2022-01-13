class Division < ApplicationRecord
    validates_presence_of :div_name, :div_short, :client_id
    has_many :clients, foreign_key: 'id', primary_key: 'client_id'
end
