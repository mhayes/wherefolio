require "test_helper"

class SigninTest < IntegrationTest  
  it "should provide an option to signin" do
    visit root_path
    current_path.must_equal root_path
    
    page.must_have_selector ".navbar", text: "Sign In"
    page.wont_have_selector ".dropdown-menu", text: "Account"
    page.wont_have_selector ".dropdown-menu", text: "Sign Out"
  end
  
  it "should allow a user to signin" do
    @user = FactoryGirl.create(:user)
    login_as(@user)
    
    visit root_path
    current_path.must_equal root_path
    
    page.must_have_selector ".navbar", text: @user.name
    page.must_have_selector ".dropdown-menu", text: "Account"
    page.must_have_selector ".dropdown-menu", text: "Sign Out"
  end
end