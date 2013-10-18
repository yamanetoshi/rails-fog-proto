namespace :start_stop_vm do
  desc "execute start and stop vm"

  task :execute => :environment do 
    now = Time.now
    Resavation.find_all_by_hour(now.hour.to_s).each do |r|
      if r.min[0] == now.min.to_s[0]
        if r.operation == "Start"
          VirtualMachine.start_vm(Conn.find(r.conn_id), r.vmid)
        elsif r.operation == "Stop"
          VirtualMachine.stop_vm(Conn.find(r.conn_id), r.vmid)
	end
      end
    end
  end
end
