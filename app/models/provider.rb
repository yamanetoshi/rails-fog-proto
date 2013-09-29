class Provider < ActiveRecord::Base
  has_many :conns
  attr_accessible :name
end
