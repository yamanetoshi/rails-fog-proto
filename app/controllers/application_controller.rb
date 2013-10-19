class ApplicationController < ActionController::Base
#  skip_before_filter :verify_authenticity_token, :only => [:create, :update, :destroy]
  protect_from_forgery # :secret => 'my-little-pony'

  def admin_login
    unless current_user.try(:admin?)
      redirect_to :controller => 'conns', :action => 'index'
    end
  end

  protected

  def handle_unverified_request
    raise ActionController::InvalidAuthenticityToken
  end
end
