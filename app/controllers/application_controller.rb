class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_login
    unless current_user.admin?
      redirect_to :controller => 'conns', :action => 'index'
    end
  end
end
