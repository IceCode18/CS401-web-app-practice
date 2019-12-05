require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "Signing the Up" do
    visit signup_path
    
    fill_in "Name", with: "Test Account"
    fill_in "Email", with: "test@account.com"
    fill_in "Password", with: "secret"
    fill_in "Confirm Password", with: "secret"
    
    click_on "Sign Up!"
  
    assert_text "Account Created"
    assert_selector "nav", text: "Logout"
    refute_selector "nav", text: "Login"
  end
  
  test "Signing up doesn't work with errors" do
    visit signup_path
    
    fill_in "Name", with: "Test Account"
    fill_in "Password", with: "secret"
    fill_in "Confirm Password", with: "secret"
    
    click_on "Sign Up!"
  
    assert_text "fix the errors"
    assert_selector "nav", text: "Login"
    refute_selector "nav", text: "Logout"
  end
  
  test "Login with user works" do
    user = FactoryBot.create :user, email: "test@account.com", password: "secret"
    
    visit login_path
    fill_in "Email", with: "test@account.com"
    fill_in "Password", with: "secret"
   
    
    click_on "Login"
  
    assert_text "Logged in"
    assert_selector "nav", text: "Logout"
    refute_selector "nav", text: "Login"
  end
  
  test "Login with wrong password fails" do
    user = FactoryBot.create :user, email: "test@account.com", password: "secret"
    
    visit login_path
    fill_in "Email", with: "test@account.com"
    fill_in "Password", with: "opps"
   
    
    click_on "Login"
  
    assert_text "Invalid"
    assert_selector "nav", text: "Login"
  end
  
end
