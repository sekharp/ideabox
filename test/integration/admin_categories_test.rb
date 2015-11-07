require "test_helper"

class AdminCategoriesTest < ActionDispatch::IntegrationTest

  test 'logged in admin sees categories index' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    assert page.has_content?("All Categories")
  end

  test 'default user does not see admin categories index' do
    user = User.create(username: "default_user",
                        password: "password",
                        role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_categories_path
    refute page.has_content?("All Categories")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

  test 'admin can create a category' do
    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_categories_path
    assert page.has_content?("All Categories")

    click_link "Create"

    fill_in "Name", with: "Bluegrass"
    click_button "Create Category"

    assert page.has_content?("Bluegrass")

  end
end
