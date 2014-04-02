include Warden::Test::Helpers

#RSpec.configure do |config|
#  config.include ControllerMacros, :type => :request
#end

module RequestHelpers
  def create_logged_in_user
    conn = FactoryGirl.create :conn
    user = User.find(conn.user_id)
    user.confirm!
    user.save!
    login(user)
    user
  end

  def create_logged_in_admin_user
    user = FactoryGirl.create :adminuser
    user.confirm!
    user.save!
    login(user)
    user
  end
 
  def login(user)
    login_as user, scope: :user, :run_callbacks => false
  end

end
