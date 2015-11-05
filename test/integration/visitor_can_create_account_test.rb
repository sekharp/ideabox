require 'test_helper'

class VisitorCanCreateAccountTest < ActionDispatch::IntegrationTest
  def login_user
    User.create(username: "Clarence",
                password: "password")

    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login"
  end

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

  test "registered user cannot login with wrong password" do
    User.create(username: "Clarence",
                password: "password")

    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "capybara"
    click_button "Login"

    assert page.has_content?("Invalid Password")
  end

  test "authenticated user can logout" do
    login_user

    assert page.has_content?("Welcome, Clarence!")

    click_link "Logout"

    assert page.has_content?("Goodbye!")
  end

end
