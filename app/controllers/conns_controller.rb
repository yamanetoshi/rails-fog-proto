class ConnsController < ApplicationController
  before_filter :authenticate_user!
  # GET /conns
  # GET /conns.json
  def index
    @conns = Conn.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conns }
    end
  end

  # GET /conns/1
  # GET /conns/1.json
  def show
    @conn = Conn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conn }
    end
  end

  # GET /conns/new
  # GET /conns/new.json
  def new
    @conn = Conn.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conn }
    end
  end

  # GET /conns/1/edit
  def edit
    @conn = Conn.find(params[:id])
  end

  # POST /conns
  # POST /conns.json
  def create
    @conn = Conn.new(params[:conn])

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
    @conn = Conn.find(params[:id])

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
    @conn = Conn.find(params[:id])
    @conn.destroy

    respond_to do |format|
      format.html { redirect_to conns_url }
      format.json { head :no_content }
    end
  end
end
