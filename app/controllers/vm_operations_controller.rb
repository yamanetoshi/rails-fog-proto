require 'fog'
require 'json'

class VmOperationsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| 
    c.request.format == 'application/json' }
#  protect_from_forgery :except => ["create"]

  def index
    session[:idx] = params[:idx]
    session[:conn] = current_user.conns[params[:idx].to_i]

    puts "*** debug ***"
    puts session[:idx]
    puts session[:conn]
    puts current_user
    puts "*** debug ***"

    @virtual_machines = VirtualMachine.find_by_conn(current_user.conns[params[:idx].to_i])
    ret = {:virtual_machines => @virtual_machines, :authenticity => form_authenticity_token }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @virtual_machines }
#      format.json { render json: ret }
    end
  end

  def new
    puts "*** debug ***"
    puts session[:idx]
    puts session[:conn]
    puts current_user
    puts "*** debug ***"

#    new = {:authenticity => form_authenticity_token, :connid => session[:conn].id.to_s, :idx => session[:idx] }
    respond_to do |format|
      format.html # new.html.erb
#      format.json { render json: new }
    end
  end

  def create
    session[:idx] = params[:idx]
    session[:conn] = Conn.find(params[:connid])
    VirtualMachine.create_vm(session[:conn], params[:hostname])
    @virtual_machines = VirtualMachine.find_by_conn(session[:conn])
    respond_to do |format|
      format.html { redirect_to :action => 'index', :idx => session[:idx] }
      format.json { render json: @virtual_machines }
    end
  end

  def start
    VirtualMachine.start_vm(session[:conn], params[:id])
    @virtual_machines = VirtualMachine.find_by_conn(session[:conn])
    respond_to do |format|
      format.html { redirect_to :action => 'index', :idx => session[:idx] }
      format.json { render json: @virtual_machines }
    end
  end

  def stop
    VirtualMachine.stop_vm(session[:conn], params[:id])
    @virtual_machines = VirtualMachine.find_by_conn(session[:conn])
    respond_to do |format|
      format.html { redirect_to :action => 'index', :idx => session[:idx] }
      format.json { render json: @virtual_machines }
    end
  end

  def reboot
    VirtualMachine.reboot_vm(session[:conn], params[:id])
    @virtual_machines = VirtualMachine.find_by_conn(session[:conn])
    respond_to do |format|
      format.html { redirect_to :action => 'index', :idx => session[:idx] }
      format.json { render json: @virtual_machines }
    end
  end
end
