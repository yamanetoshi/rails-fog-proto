require 'spec_helper'

describe Provider do
  it { should respond_to(:conns) }
  it { should respond_to(:name) }
  it { should respond_to(:create_vm) }
  it { should respond_to(:start_vm) }
  it { should respond_to(:stop_vm) }
end
