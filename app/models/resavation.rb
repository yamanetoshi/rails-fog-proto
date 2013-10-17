class Resavation < ActiveRecord::Base
  belongs_to :conn
  attr_accessible :hour, :min, :operation, :vmid, :conn_id
end
