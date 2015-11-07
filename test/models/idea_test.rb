
require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test "idea is valid" do
    skip
    idea = Idea.new(title: 'Title', body: 'Body')

    assert idea.valid?
  end

  test 'idea must have a title' do
    skip
    idea = Idea.new(body: 'body')

    refute idea.valid?
  end

  test 'idea must have a body' do
    skip
    idea = Idea.new(title: 'title')

    refute idea.valid?
  end
end
