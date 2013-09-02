class Conn < ActiveRecord::Base
  belongs_to :user
  attr_accessible :access_key, :end_point, :secret_access_key
end
