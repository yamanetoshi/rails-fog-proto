require 'fog'

class VirtualMachine < ActiveRecord::Base

  def self.find_by_conn(conn)
    virtual_machines = Hash::new

    @conn = conn
    @uri = URI.parse(conn.end_point)
    compute = make_compute

    virtual_machines[:conn] = @conn
    virtual_machines[:vms] = compute.list_virtual_machines
    virtual_machines
  end

  def self.create_vm(conn, hostname)
    @conn = conn
    @uri = URI.parse(conn.end_point)
    compute = make_compute

    compute.send(conn.provider.create_vm.to_sym, {
      'displayname' => hostname,
      'serviceOfferingId' => '24',
      'templateId' => '4405',
      'zoneId' => '1',
                                   })
  end

  def self.start_vm(conn, id)
    @conn = conn
    @uri = URI.parse(conn.end_point)
    compute = make_compute

    compute.send(conn.provider.start_vm.to_sym, {'id' => id})
  end

  def self.stop_vm(conn, id)
    @conn = conn
    @uri = URI.parse(conn.end_point)
    compute = make_compute

    compute.send(conn.provider.stop_vm.to_sym, {'id' => id})
  end

  private
  def self.make_compute
    compute = Fog::Compute.new(:provider => @conn.provider.name,
                               :cloudstack_api_key => @conn.access_key,
                               :cloudstack_secret_access_key => @conn.secret_access_key,
                               :cloudstack_host => @uri.host,
                               :cloudstack_port => @uri.port,
                               :cloudstack_path => @uri.path,
                               :cloudstack_scheme => @uri.scheme,
                               )
    compute
  end
end
