class Conn < ActiveRecord::Base
  belongs_to :user
  belongs_to :provider
  has_many :virtual_machines
  attr_accessible :access_key, :end_point, :secret_access_key, :name, :provider_id
end
