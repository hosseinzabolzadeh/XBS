require 'spec_helper'

describe "User Pages" do
 subject { page }
 describe "sign up page" do
  before { visit signup_path }
   it { should have_selector('h1', :text => 'SIGNUP')}
 end
 describe "profile page" do
  let(:user) { FactoryGirl.create(:user) }
  before { visit user_path(user)}
  it { should have_selector('title', :text => user.first_name) }
 end
 describe "signup" do
  before { visit signup_path }
  let(:submit) { "Create My Account" }
  describe "With invalid information" do
   it "should not create a user" do
    expect { click_button submit }.not_to change(User, :count)
   end
  end
  describe "with valid information" do
   before do
    fill_in "first_name",               :with => "Hossein"
    fill_in "last_name",                :with => "Zabolzadeh"
    fill_in "email",                    :with => "zabolzadeh@csri.ac.ir"
    fill_in "password",                 :with => "foobar"
    fill_in "confirmation",             :with => "foobar"
   end
   it "should create a user" do
    expect { click_button submit }.to change(User, :count).by(1)
   end
  end

 describe "edit" do
  let(:user) {FactoryGirl.create(:user)}
  before {visit edit_user_path(user)}
  describe "edit page" do
   it {should have_selector('h3', :text => "Update your profile")}
   it {should have_selector('title', :text => "Edit user")}
  end
  describe "with invalid information" do
    before { click_button "Save changes" }
    it {should have_content('error')}
 end
end
end
end
