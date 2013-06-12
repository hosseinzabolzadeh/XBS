require 'spec_helper'

describe "UserPages" do
 subject { page }
 describe "sign up page" do
  before {visit signup_path}
   it { should have_selector('h1', :text => 'Sign Up')}
 end
 describe "profile page" do
  let(:user) {FactoryGirl.create(:user)}
  before { visit user_path(user)}
  it { should have_selector('title', text: user.first_name) }
 end
end
