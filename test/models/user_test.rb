require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is valid" do
    idea = User.new(username: 'jill', password: 'jill')
    assert idea.valid?
  end
end
