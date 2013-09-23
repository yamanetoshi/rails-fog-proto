#module ValidUserRequestHelper
#  def sign_in_as_a_valid_user
#    @user ||= FactoryGirl.create :user
#    post_via_redirect user_sesssion_path, 'user[email]' => @user.email, 'user[password]' => @user.password
#  end
#end
#
#RSpec.configure do |config|
#  config.include ValidUserRequestHelper, :type => :request
#end
