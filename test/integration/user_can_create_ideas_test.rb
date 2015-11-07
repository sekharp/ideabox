require 'test_helper'

class UserCanCreateIdeas < ActionDispatch::IntegrationTest
  def login_user
    User.create(username: "Clarence",
                password: "password")

    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  test 'user can create an idea' do
    login_user

    assert page.has_content?("Welcome, Clarence!")

    click_link "New Idea"
    visit idea_path
    fill_in "Name", with: "Dinner Ideas"
    click_button "Create Idea"

    assert page.has_content?("Ideas")

  end
end
