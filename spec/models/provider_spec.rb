require 'spec_helper'

describe Provider do
  context 'attr_accessible' do
    before do
      @obj = Provider.new
      @accessible = [:name, :create_vm, :start_vm, :stop_vm, :reboot_vm, :list_vm]
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

  it { should respond_to(:conns) }
  it { should respond_to(:name) }
  it { should respond_to(:create_vm) }
  it { should respond_to(:start_vm) }
  it { should respond_to(:stop_vm) }
  it { should respond_to(:reboot_vm) }
  it { should respond_to(:list_vm) }
end
