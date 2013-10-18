class ResavationsController < ApplicationController
  before_filter :authenticate_user!

  # GET /resavations
  # GET /resavations.json
  def index
    @resavations = Resavation.all
#    @resavations = Resavation.find_by_vmid_and_conn_id(params[:id], session[:conn].id)
#    if (@resavations == nil)
#      @resavations = []
#    session[:vmid] = params[:id]
#    @resavations = Resavation.find_all_by_vmid_and_conn_id(params[:id], session[:conn].id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resavations }
    end
  end

  # GET /resavations/1
  # GET /resavations/1.json
  def show
    @resavation = Resavation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resavation }
    end
  end

  # GET /resavations/new
  # GET /resavations/new.json
  def new
    @resavation = Resavation.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resavation }
    end
  end

  # GET /resavations/1/edit
  def edit
    @resavation = Resavation.find(params[:id])
  end

  # POST /resavations
  # POST /resavations.json
  def create
    @resavation = Resavation.new(params[:resavation])
#    @resavation.vmid = session[:vmid]
#    session[:conn].resavation = @resavation

    respond_to do |format|
      if @resavation.save
        format.html { redirect_to @resavation, notice: 'Resavation was successfully created.' }
        format.json { render json: @resavation, status: :created, location: @resavation }
      else
        format.html { render action: "new" }
        format.json { render json: @resavation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resavations/1
  # PUT /resavations/1.json
  def update
    @resavation = Resavation.find(params[:id])

    respond_to do |format|
      if @resavation.update_attributes(params[:resavation])
        format.html { redirect_to @resavation, notice: 'Resavation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resavation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resavations/1
  # DELETE /resavations/1.json
  def destroy
    @resavation = Resavation.find(params[:id])
    @resavation.destroy

    respond_to do |format|
      format.html { redirect_to resavations_url }
      format.json { head :no_content }
    end
  end
end
