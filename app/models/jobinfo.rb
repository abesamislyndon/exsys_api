class Jobinfo < ApplicationRecord
  #has_many :items, primary_key: :id , foreign_key: 'item_id'
  has_many :defect_details,   dependent: :destroy 
  has_many :partsreplaces,   dependent: :destroy 
 # has_many :partsreplaces,   dependent: :destroy
  accepts_nested_attributes_for :defect_details, allow_destroy: true ,  reject_if: :all_blank
  accepts_nested_attributes_for :partsreplaces, allow_destroy: true,   reject_if: :all_blank 
  validates_presence_of  :client_name, :division_name, :block, :address, :natureofcomplain, :dateEntry, :gtotal


def self.total_amount
  sql = "SELECT sum(gtotal) as total_amount ,  count(*) as total_outstanding from jobinfos"
  ActiveRecord::Base.connection.execute(sql)
end



end
  