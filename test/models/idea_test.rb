
require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test "idea is valid" do
    idea = Idea.new(name: 'name')

    assert idea.valid?
  end
end
