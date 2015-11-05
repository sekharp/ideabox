require 'test_helper'

class VisitorCanCreateAccountTest < ActionDispatch::IntegrationTest
  test 'user can create account' do
    visit new_user_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, Clarence!")
  end

  test "guest cannot login" do
    visit login_path
    fill_in "Username", with: "Torie"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Invalid Login")
  end
end
