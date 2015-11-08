require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test "image is valid" do
    idea = Image.new(name: 'name', link: 'www.google.com')

    assert idea.valid?
  end
end
