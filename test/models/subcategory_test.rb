require 'test_helper'

class SubcategoryTest < ActiveSupport::TestCase
  test "should not save subcategory without parameters" do
    subcategory = Subcategory.new
    assert_not subcategory.save
  end

  test "should save subcategory with category id and title" do
    category = Category.new({ title: "Banking", description: "" })
    category.save
    subcategory = Subcategory.new({ category_id: category.id, title: "123", description: "" })
    assert subcategory.save
  end

  test "should not save subcategory without parent category id" do
    subcategory = Subcategory.new({ title: "Banking", description: "" })
    assert_not subcategory.save
  end

  test "should not save subcategory with unexisting category id" do
    subcategory = Subcategory.new({ id: 13579, title: "Banking", description: "" })
    assert_not subcategory.save
  end

  test "should update subcategory with correct params" do
    category = Category.new({ title: "Banking", description: "Fox" })
    category.save
    subcategory = Subcategory.new({ category_id: category.id, title: "123", description: "" })
    subcategory.save
    subcategory.update({ title: "Hunting", description: "Rabbits"})
    assert subcategory.save
  end

  test "should not update subcategory with incorrect params" do
    category = Category.new({ title: "Banking", description: "Fox" })
    category.save
    subcategory = Subcategory.new({ category_id: category.id, title: "123", description: "" })
    subcategory.save
    subcategory.update({ title: "H", description: "Rabbits"})
    assert_not subcategory.save
  end

  test "should not save subcategory if title is too long" do
    category = Category.new({ title: "Banking", description: "Fox" })
    category.save
    subcategory = Subcategory.new({ category_id: category.id, title: "123456789012345678901", description: "123454321" })
    assert_not subcategory.save
  end
end
