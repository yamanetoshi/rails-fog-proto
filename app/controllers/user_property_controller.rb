class UserPropertyController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_login

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
end
