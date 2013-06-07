require 'spec_helper'

describe "StaticPages" do
 subject { page }
  describe "Home page" do
  before { visit root_path }
  it { should have_selector('title', :text => 'Xamin Build Studio') }
 end
end
