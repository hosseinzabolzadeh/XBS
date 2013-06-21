require 'spec_helper'

describe "index" do
 before do
  sign_in FactoryGirl.create(:user)
  GactoryGirl.create(:user, :name => "Bob", :email => "bob@example.com")
  GactoryGirl.create(:user, :name => "Ben", :email => "ben@example.com")
  visit users_path
 end
 it { should have_selector('title', :text => 'All users') }
 it { should have_selector('h1', :text => 'All users') }
 it "should list each user" do
  User.all.each do |user|
   page.should have_selector('li', :text => user.name)
  end
 end
end
