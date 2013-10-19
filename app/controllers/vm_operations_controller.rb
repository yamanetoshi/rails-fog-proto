require 'fog'
require 'json'

class VmOperationsController < ApplicationController
  before_filter :authenticate_user!
#  skip_before_filter :verify_authenticity_token, :only => [:create]
  protect_from_forgery :except => [:create]
#  protect_from_forgery :only => ["index", "new", "start", "stop", "reboot"]
#  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  def index
    session[:idx] = params[:idx]
    session[:conn] = current_user.conns[params[:idx].to_i]

    puts "*** debug ***"
    puts session[:idx]
    puts session[:conn]
    puts current_user
    puts "*** debug ***"

    @virtual_machines = VirtualMachine.find_by_conn(current_user.conns[params[:idx].to_i])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @virtual_machines }
    end
  end

  def new
#    form_authenticity_token
    puts "*** debug ***"
    puts session[:_csrf_token]
#    authenticity = { :key => session[:_csrf_token] }
    authenticity = { :key => form_authenticity_token }
    puts authenticity
    puts session[:_csrf_token]
    puts "*** debug ***"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: authenticity }
    end
  end

  def create
    puts "*** create ***"
    puts params[:authenticity_token]
    puts session[:_csrf_token]
    puts "*** create ***"
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
