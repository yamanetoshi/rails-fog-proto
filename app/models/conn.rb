class Conn < ActiveRecord::Base
  attr_accessible :access_key, :end_point, :secret_access_key
end
