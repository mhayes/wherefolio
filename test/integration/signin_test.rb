require "test_helper"

class SigninTest < IntegrationTest
  setup do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end
  
  it "should allow a user to signin" do
    visit root_path
    current_path.must_equal root_path
    
    page.must_have_selector ".navbar", text: @user.name
    page.must_have_selector ".navbar", text: "Account"
    page.must_have_selector ".navbar", text: "Sign Out"
  end
end