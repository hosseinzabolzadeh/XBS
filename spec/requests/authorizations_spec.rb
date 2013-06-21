require 'spec_helper'

describe "Authorizations" do
 subject { page }
 describe "visiting the user index" do
  before { visit users_path}
  it { should have_selector('title', :text => "Sign in") }
 end 
end
