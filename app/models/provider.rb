class Provider < ActiveRecord::Base
  has_many :conns
  attr_accessible :name, :create_vm, :start_vm, :stop_vm, :reboot_vm, :list_vm
end
