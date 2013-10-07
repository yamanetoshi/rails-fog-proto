# Be sure to restart your server when you modify this file.

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Shurijp::Application.config.session_store :active_record_store

# Shurijp::Application.config.session_store :cookie_store, key: '_shurijp_session'
Shurijp::Application.config.session_store :redis_store, :servers => { :host => "localhost", :port => 6379, :namespace => "sessions" }
