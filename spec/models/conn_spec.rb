require 'spec_helper'

describe Conn do

  context 'attr_accessible' do
    before do
      @obj = Conn.new
      @accessible = [:access_key, :end_point, :secret_access_key, :name, :provider_id]
    end

    it 'check all columns accessible' do
      @obj.class.column_names.each do |name|
        if @accessible.include?(name.to_sym)
          @obj.should be_accessible name.to_sym
        else
          @obj.should_not be_accessible name.to_sym
        end
      end
    end
  end

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
