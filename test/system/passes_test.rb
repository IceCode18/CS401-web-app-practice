require "application_system_test_case"

class PassesTest < ApplicationSystemTestCase
  test "index page shows all passes" do
    user = login_user
    pass1 = FactoryBot.create :pass, user: user
    pass2 = FactoryBot.create :pass, user: user
  
    visit passes_path
    
    assert_text pass1.from
    assert_text pass2.from
  end
  
  test "logged out users cannot see passes" do
    visit passes_path
    
    assert_equal page.current_path, login_path
    assert_text "You need to login"
  end
  
  test "create a new pass" do
    user = login_user
    visit passes_path
    
    visit new_pass_path
    fill_in "Website", with: "New Site"
    fill_in "Description", with: "New Description"
    click_button "Submit Guest Pass!"
    
    assert_text "Guest Pass Submitted!"
    assert_text "New Site"
    assert_text "New Description"
  end
  
  test "edit/update a pass" do
    user = login_user
    pass = FactoryBot.create :pass, user: user
  
    visit passes_path
    
    click_on "Edit"
    fill_in "Website", with: "New Site"
    fill_in "Description", with: "New Description"
    click_button "Update Guest Pass"
    
    assert_text "Guest Pass Updated!"
  end
  
  test "delete a pass" do
    user = login_user
    pass = FactoryBot.create :pass, user: user
  
    visit passes_path
    
    click_on pass.from
    click_on "Delete"
    assert_text "Delete"
  end
  
end
