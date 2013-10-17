class VmresavationController < ApplicationController
  before_filter :authenticate_user!

  def index
    @resavations = Resavation.find_all_by_vmid_and_conn_id(params[:id], session[:conn].id)
#    if (@resavations == nil)
#      @resavations = []
    session[:vmid] = params[:id]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resavations }
    end
  end

  def new
    @resavation = Resavation.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resavation }
    end
  end

  def create
    @resavation = Resavation.new(params[:resavation])
    @resavation.vmid = session[:vmid]
    @resavation.conn_id = session[:conn].id
#    session[:conn].resavation = @resavation

    respond_to do |format|
      if @resavation.save
#        format.html { redirect_to @resavation, notice: 'Resavation was successfully created.' }
        format.html { redirect_to :action => "index", :id => session[:vmid] }
        format.json { render json: @resavation, status: :created, location: @resavation }
      else
        format.html { render action: "new" }
        format.json { render json: @resavation.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @resavation = Resavation.find(params[:id])
  end

  def update
    @resavation = Resavation.find(params[:id])

    respond_to do |format|
      if @resavation.update_attributes(params[:resavation])
        format.html { redirect_to :action => "index", :id => session[:vmid] }
#        format.html { redirect_to @resavation, notice: 'Resavation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resavation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resavation = Resavation.find(params[:id])
    @resavation.destroy

    respond_to do |format|
      format.html { redirect_to :action => "index", :id => session[:vmid] }
#      format.html { redirect_to resavations_url }
      format.json { head :no_content }
    end
  end
end
