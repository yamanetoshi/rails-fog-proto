require 'fog'
require 'json'

class ConnsController < ApplicationController
  before_filter :authenticate_user!
  # GET /conns
  # GET /conns.json
  def index
#    @conns = Conn.all
    @conns = current_user.conns

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conns }
    end
  end

  # GET /conns/1
  # GET /conns/1.json
  def show
#    @conn = Conn.find(params[:id])
    @conn = current_user.conns.find(params[:id])

#    str = "@conns : " + @conn.end_point
#    logger.debug str
#    logger.debug "debug @conns : " + @conn.end_point

cloudstack_uri = URI.parse(@conn.end_point)

    @compute = Fog::Compute.new(
:provider => 'CloudStack',
:cloudstack_api_key => @conn.access_key,
:cloudstack_secret_access_key => @conn.secret_access_key,
:cloudstack_host => cloudstack_uri.host,
:cloudstack_port => cloudstack_uri.port,
:cloudstack_path => cloudstack_uri.path,
:cloudstack_scheme => cloudstack_uri.scheme,
)

#    logger.debug @compute.list_virtual_machines

    ret = JSON.parse(@compute.list_virtual_machines.to_json)
#    logger.debug ret["listvirtualmachinesresponse"]["virtualmachine"].length
#    logger.debug ret["listvirtualmachinesresponse"]["virtualmachine"][0]["name"]
    @array = ret["listvirtualmachinesresponse"]["virtualmachine"]
#    array.map{|i| logger.debug i["name"]}

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conn }
    end
  end

  # GET /conns/new
  # GET /conns/new.json
  def new
#    @conn = Conn.new
    @conn = current_user.conns.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conn }
    end
  end

  # GET /conns/1/edit
  def edit
#    @conn = Conn.find(params[:id])
    @conn = current_user.conns.find(params[:id])
  end

  # POST /conns
  # POST /conns.json
  def create
#    @conn = Conn.new(params[:conn])
    @conn = current_user.conns.build(params[:conn])

    respond_to do |format|
      if @conn.save
        format.html { redirect_to @conn, notice: 'Conn was successfully created.' }
        format.json { render json: @conn, status: :created, location: @conn }
      else
        format.html { render action: "new" }
        format.json { render json: @conn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conns/1
  # PUT /conns/1.json
  def update
#    @conn = Conn.find(params[:id])
    @conn = current_user.conns.find(params[:id])

    respond_to do |format|
      if @conn.update_attributes(params[:conn])
        format.html { redirect_to @conn, notice: 'Conn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @conn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conns/1
  # DELETE /conns/1.json
  def destroy
#    @conn = Conn.find(params[:id])
    @conn = current_user.conns.find(params[:id])
    @conn.destroy

    respond_to do |format|
      format.html { redirect_to conns_url }
      format.json { head :no_content }
    end
  end
end
