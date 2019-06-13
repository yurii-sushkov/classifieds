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

  test "should update category with correct params" do
    category = Category.new({ title: "Banking", description: "Fox" })
    category.save
    category.update({ title: "Hunting", description: "Rabbits"})
    assert category.save
  end

  test "should not update category with incorrect params" do
    category = Category.new({ title: "Banking", description: "Fox" })
    category.save
    category.update({ title: "H", description: "R"})
    assert_not category.save
  end

  test "should not save category if title is too long" do
    category = Category.new({ title: "123456789012345678901", description: "123454321" })
    assert_not category.save
  end
end
