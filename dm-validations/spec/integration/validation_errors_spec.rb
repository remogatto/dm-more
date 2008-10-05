require 'pathname'
require Pathname(__FILE__).dirname.expand_path.parent + 'spec_helper'

describe DataMapper::Validate::ValidationErrors do

  before(:each) do
    @errors = DataMapper::Validate::ValidationErrors.new
  end

  it 'should add a validation error' do
    @errors.add(:field, 'error message')
    @errors[:field].should == ['error message']
  end

  it "should report that it is empty on first creation" do
    @errors.empty?.should == true
  end

  it "should continue to report that it is empty even after being checked" do
    @errors.on(:foo)
    @errors.empty?.should == true
  end

  it "should allow client code to iterate through field/error pairs" do
    errors = {:field1 => 'msg1', :field2 => 'msg2' }.each { |field, msg| @errors.add(field, msg) }
    @errors.each do |field, msg|
      errors[field].should == msg.to_s
    end
  end

end
