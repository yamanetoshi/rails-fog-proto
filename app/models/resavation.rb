class Resavation < ActiveRecord::Base
  attr_accessible :conn_id, :hour, :min, :operation, :vmid
end
