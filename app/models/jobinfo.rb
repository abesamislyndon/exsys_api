class Jobinfo < ApplicationRecord
  #has_many :items, primary_key: :id , foreign_key: 'item_id'
  has_one_attached :photo
  has_many :defect_details, dependent: :destroy 
  has_many :partsreplaces,   dependent: :destroy 
 # has_many :partsreplaces,   dependent: :destroy
  accepts_nested_attributes_for :defect_details, allow_destroy: true ,  reject_if: :all_blank
  accepts_nested_attributes_for :partsreplaces, allow_destroy: true,   reject_if: :all_blank 
  validates_presence_of  :client_name, :division_name, :block, :address, :natureofcomplain, :dateEntry, :gtotal
 

def self.total_amount
  sql = "SELECT sum(gtotal) as total_amount ,  count(*) as total_outstanding from jobinfos where status = 0"
  ActiveRecord::Base.connection.execute(sql)
end

def self.outstanding
  sql = "SELECT * from jobinfos where status = 0"
  ActiveRecord::Base.connection.execute(sql)
end

def self.completed_jobwork
  sql = "SELECT * from jobinfos where status = 1"
  ActiveRecord::Base.connection.execute(sql)
end

def self.outstandingchart
  sql = "
  SELECT   client_name, SUM(gtotal)
  FROM jobinfos
  WHERE status = 0
  GROUP BY client_name
"
result =  ActiveRecord::Base.connection.exec_query(sql)
end

def self.outstandingchartcount
  sql = "
  SELECT   client_name, COUNT(*) 
  FROM jobinfos
  WHERE status = 0
  GROUP BY   client_name
"
result =  ActiveRecord::Base.connection.exec_query(sql)
end


def self.completed_jobwork_personnel(userid)
  sql = "SELECT * from jobinfos where status = 1 and userid = #{userid} "
  ActiveRecord::Base.connection.execute(sql)
end

def self.outstanding_jobwork_personnel(userid)
  sql = "SELECT * from jobinfos where status = 0 and userid = #{userid} "
  ActiveRecord::Base.connection.execute(sql)
end

def self.total_count_personnel_outstanding(userid)
  sql = "
  SELECT COUNT(*) 
  FROM jobinfos
  WHERE status = 0
  and userid = #{userid}  "
  ActiveRecord::Base.connection.execute(sql)
end

def self.total_count_personnel_done(userid)
  sql = "
  SELECT COUNT(*) 
  FROM jobinfos
  WHERE status = 1
  and userid = #{userid}  "
  ActiveRecord::Base.connection.execute(sql)
end

end
  