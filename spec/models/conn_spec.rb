require 'spec_helper'

describe Conn do
  it { should respond_to(:user) }
  it { should respond_to(:virtual_machines) }
  it { should respond_to(:access_key) }
  it { should respond_to(:end_point) }
  it { should respond_to(:secret_access_key) }
  it { should respond_to(:provider) }
  it { should respond_to(:name) }
  it { should belong_to(:user) }
  it { should belong_to(:provider) }
end
