require 'spec_helper'

describe Resavation do
  before do
    @obj = Resavation.new
    @accessible = [:conn_id, :hour, :min, :operation, :vmid]
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

  it { should belong_to(:conn) }
  it { should respond_to(:hour) }
  it { should respond_to(:min) }
  it { should respond_to(:operation) }
  it { should respond_to(:vmid) }
end
