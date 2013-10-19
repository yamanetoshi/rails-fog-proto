class ApplicationController < ActionController::Base
#  skip_before_filter :verify_authenticity_token
  protect_from_forgery # :secret => 'my-little-pony'

  def admin_login
    unless current_user.try(:admin?)
      redirect_to :controller => 'conns', :action => 'index'
    end
  end
end
