class Conn < ActiveRecord::Base
  belongs_to :user
  has_many :virtual_machines
  attr_accessible :access_key, :end_point, :secret_access_key, :provider, :name
end
