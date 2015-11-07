require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "category is valid" do
  skip
    category = Category.new(name: 'Name')

    assert category.valid?
  end

  test 'category must have a name' do
    skip
    category = Category.new({})

    refute category.valid?
  end
end
