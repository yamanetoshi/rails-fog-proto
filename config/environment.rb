# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Shurijp::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => '127.0.0.1',
  :port           => '25',
#  :authentication => :plain,
#  :user_name      => ENV['SENDGRID_USERNAME'],
#  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'ctrl.shuri.jp',
#  :enable_starttls_auto => true
  :enable_starttls_auto => false
}
