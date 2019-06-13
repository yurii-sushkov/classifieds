require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "should not save category without title" do
    category = Category.new
    assert_not category.save
  end

  test "should not save category if title is too short" do
    category = Category.new({ title: "12", description: "" })
    assert_not category.save
  end

  test "should save category with title" do
    category = Category.new({ title: "Banking", description: "" })
    assert category.save
  end
end
