require "test_helper"

class SigninTest < IntegrationTest
  it "should allow a user to signin" do
    user = FactoryGirl.create(:user)
    login_as(user)
    save_and_open_page
  end
end