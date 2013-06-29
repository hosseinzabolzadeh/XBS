require 'spec_helper'

describe Appliance do
 let(:user) { FactoryGirl.create(:user) }
 before { @appliance = user.appliances.build(:name => "MySQL", :description => "This is relational SQL database appliance.", :icon => "assets/appliance_icons/app1.png") }
 subject { @appliance }
 
 it { should respond_to(:user_id) }
 it { should respond_to(:icon)}
 it { should respond_to(:description) }
 it { should respond_to(:name) }
 it { should respond_to(:user) }
 its(:user) {should == user}
 it { should be_valid }
 describe "when user id is not present" do
  before {@appliance.user_id = nil }
   it { should_not be_valid }
 end
 describe "accessible attributes" do
  it " should not allow access to user id" do
   expect do
    Appliance.new(:user_id => user.id)
   end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
  end
 end
end
