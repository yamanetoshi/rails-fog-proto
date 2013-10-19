require 'fog'
require 'json'

class VmOperationsController < ApplicationController
  before_filter :authenticate_user!
#  skip_before_filter :verify_authenticity_token, :only => [:create]
#  protect_from_forgery :except => ["create"]

  def index
    session[:idx] = params[:idx]
    session[:conn] = current_user.conns[params[:idx].to_i]
    @virtual_machines = VirtualMachine.find_by_conn(current_user.conns[params[:idx].to_i])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @virtual_machines }
    end
  end

  def new
    form_authenticity_token
    puts "*** debug ***"
    puts session[:_csrf_token]
    authenticity = { :key => session[:_csrf_token] }
    puts authenticity
    puts "*** debug ***"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: authenticity }
    end
  end

  def create
    puts "*** csrf_token ***" + session[:_csrf_token]
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
