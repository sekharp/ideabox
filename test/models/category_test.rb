require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "category is valid" do
    category = Category.new(name: 'Name')

    assert category.valid?
  end

  test 'category must have a name' do
    category = Category.new({})

    refute category.valid?
  end
end
