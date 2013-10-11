require 'fog'
require 'json'

class VmOperationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    session[:idx] = params[:idx]
    @virtual_machines = VirtualMachine.find_by_conn(current_user.conns[params[:idx].to_i])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @virtual_machines }
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
#      format.json { render json: @conns }
    end
  end

  def create
    logger.debug params[:hostname]
    logger.debug current_user.conns[session[:idx].to_i]
    VirtualMachine.create_vm(current_user.conns[session[:idx].to_i], params[:hostaname])
    @virtual_machines = VirtualMachine.find_by_conn(current_user.conns[params[:idx].to_i])
    respond_to do |format|
      format.html { redirect_to :action => 'index', :idx => session[:idx] }
      format.json { render json: @virtual_machines }
    end
  end

  def start
    VirtualMachine.start_vm(current_user.conns[session[:idx].to_i], params[:id])
    @virtual_machines = VirtualMachine.find_by_conn(current_user.conns[params[:idx].to_i])
    respond_to do |format|
      format.html { redirect_to :action => 'index', :idx => session[:idx] }
      format.json { render json: @virtual_machines }
    end
  end

  def stop
    VirtualMachine.stop_vm(current_user.conns[session[:idx].to_i], params[:id])
    @virtual_machines = VirtualMachine.find_by_conn(current_user.conns[params[:idx].to_i])
    respond_to do |format|
      format.html { redirect_to :action => 'index', :idx => session[:idx] }
      format.json { render json: @virtual_machines }
    end
  end

  def reboot
    VirtualMachine.reboot_vm(current_user.conns[session[:idx].to_i], params[:id])
    @virtual_machines = VirtualMachine.find_by_conn(current_user.conns[params[:idx].to_i])
    respond_to do |format|
      format.html { redirect_to :action => 'index', :idx => session[:idx] }
      format.json { render json: @virtual_machines }
    end
  end
end
