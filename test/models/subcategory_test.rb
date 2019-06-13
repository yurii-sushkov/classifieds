require 'test_helper'

class SubcategoryTest < ActiveSupport::TestCase
  test "should not save subcategory without parameters" do
    subcategory = Subcategory.new
    assert_not subcategory.save
  end

  test "should save subcategory with all category id and title" do
    category = Category.new({ title: "Banking", description: "" })
    subcategory = Subcategory.new({ category_id: category.id, title: "123", description: "" })
    assert subcategory.save
  end

  test "should not save subcategory without parent category id" do
    subcategory = Subcategory.new({ title: "Banking", description: "" })
    assert_not subcategory.save
  end
end
